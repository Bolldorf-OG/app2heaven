/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pointycastle/export.dart';

import 'constants.dart';

class SharedContentType {
  final String type;

  const SharedContentType._(this.type);

  static const prayerNote = SharedContentType._("prayer-note");
  static const prayerRequest = SharedContentType._("prayer-request");
  static const experience = SharedContentType._("experience");
  static const godsWord = SharedContentType._("gods-word");

  static const values = [prayerNote, prayerRequest, experience, godsWord];

  static SharedContentType of(String type) {
    return values.firstWhere((element) => element.type == type);
  }
}

@immutable
class PublishedSharedContent {
  final String id;
  final Uri link;
  final String editKey;
  final Uri shortLink;

  PublishedSharedContent(this.id, this.link, this.editKey, this.shortLink);
}

@immutable
class SharedContent {
  final String title;
  final String text;

  const SharedContent(this.title, this.text);

  Future<PublishedSharedContent> share(SharedContentType type) async {
    final json = jsonEncode({"title": title, "text": text});

    final key = _EncryptionHelper.rng.nextBytes(32);
    final iv = _EncryptionHelper.rng.nextBytes(16);

    final data = _EncryptionHelper.instance.encrypt(json, key, iv);
    final editKey = base64Url.encode(_EncryptionHelper.rng.nextBytes(16));

    final response = await http.post(
      Uri.https(await cloudFunctionsHost(), "/api/shared-content"),
      headers: {"Content-Type": ContentType.json.value},
      body: jsonEncode({
        "data": data,
        "editKey": editKey,
      }),
    );
    final responseData = jsonDecode(response.body);

    final id = responseData["id"];
    final longUri = Uri.https(
      "app2heaven.firebaseapp.com",
      "/shared/$id",
      {
        "t": type.type,
        "i": base64Url.encode(iv),
      },
    );

    final parameters = DynamicLinkParameters(
      uriPrefix: "https://app2heaven.page.link",
      link: longUri,
    );

    final shortLink = await parameters.buildShortLink();
    final shortUri = shortLink.shortUrl;

    final params = Map<String, dynamic>.from(shortUri.queryParametersAll);
    params["k"] = base64Url.encode(key);
    return PublishedSharedContent(
      id,
      longUri,
      editKey,
      shortUri.replace(queryParameters: params),
    );
  }

  static Future<SharedContent> load(Uri uri, Uint8List key) async {
    if (uri.pathSegments[0] != "shared" || uri.pathSegments.length != 2) {
      throw ArgumentError.value(uri, "uri", "path must be /shared/{id}");
    }

    final id = uri.pathSegments[1];
    final iv = base64Url.decode(uri.queryParameters["i"]!);

    final response = await http
        .get(Uri.https(await cloudFunctionsHost(), "/api/shared-content/$id"));
    final responseData = jsonDecode(response.body);

    final data = json.decode(
      _EncryptionHelper.instance.decrypt(
        responseData["data"],
        key,
        iv,
      ),
    );

    return SharedContent(data["title"], data["text"]);
  }
}

class _EncryptionHelper {
  static const instance = _EncryptionHelper._();

  const _EncryptionHelper._();

  static final FortunaRandom rng = () {
    final rng = FortunaRandom();
    final rand = Random.secure();
    final seeds = List.generate(32, (index) => rand.nextInt(256));
    rng.seed(KeyParameter(Uint8List.fromList(seeds)));
    return rng;
  }();

  String encrypt(String plaintext, Uint8List key, Uint8List iv) {
    final params = PaddedBlockCipherParameters(
        ParametersWithIV(KeyParameter(key), iv), null);
    final cipher =
        PaddedBlockCipherImpl(PKCS7Padding(), CBCBlockCipher(AESFastEngine()));
    cipher.init(true, params);

    final ciphertext =
        base64Url.encode(cipher.process(utf8.encode(plaintext) as Uint8List?));
    return ciphertext;
  }

  String decrypt(String ciphertext, Uint8List key, Uint8List iv) {
    final params = PaddedBlockCipherParameters(
        ParametersWithIV(KeyParameter(key), iv), null);
    final cipher =
        PaddedBlockCipherImpl(PKCS7Padding(), CBCBlockCipher(AESFastEngine()));
    cipher.init(false, params);

    final plaintext = utf8.decode(cipher.process(base64Url.decode(ciphertext)));
    return plaintext;
  }
}
