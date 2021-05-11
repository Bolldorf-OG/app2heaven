/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/export.dart';

import 'constants.dart';

@immutable
class ConfessionIvAndSalt {
  final Uint8List iv;
  final Uint8List salt;

  const ConfessionIvAndSalt(this.iv, this.salt);

  static Future<ConfessionIvAndSalt> load() async {
    final secureStorage = FlutterSecureStorage();
    return ConfessionIvAndSalt(
      base64Url.decode((await secureStorage.read(key: ConfessionConstants.keyIv))!),
      base64Url.decode((await secureStorage.read(key: ConfessionConstants.keySalt))!),
    );
  }

  static Future<ConfessionIvAndSalt> initialize() async {
    final secureStorage = FlutterSecureStorage();

    final iv = ConfessionEncryptionHelper.rng.nextBytes(16);
    final salt = ConfessionEncryptionHelper.rng.nextBytes(16);

    await secureStorage.write(
      key: ConfessionConstants.keyIv,
      value: base64Url.encode(iv),
    );
    await secureStorage.write(
      key: ConfessionConstants.keySalt,
      value: base64Url.encode(salt),
    );

    return ConfessionIvAndSalt(iv, salt);
  }

  static Future<void> clear() async {
    final secureStorage = FlutterSecureStorage();

    await secureStorage.delete(key: ConfessionConstants.keyIv);
    await secureStorage.delete(key: ConfessionConstants.keyIv);
  }
}

class ConfessionEncryptionHelper {
  static const instance = ConfessionEncryptionHelper._();

  const ConfessionEncryptionHelper._();

  static final FortunaRandom rng = () {
    final rng = FortunaRandom();
    final rand = Random.secure();
    final seeds = List.generate(32, (index) => rand.nextInt(256));
    rng.seed(KeyParameter(Uint8List.fromList(seeds)));
    return rng;
  }();

  String encrypt(String plaintext, String password, Uint8List salt, Uint8List iv) {
    final derivedKey = (PBKDF2KeyDerivator(HMac(SHA1Digest(), 64))..init(Pbkdf2Parameters(salt, 1000, 32)))
        .process(utf8.encode(password) as Uint8List);
    final keyParam = KeyParameter(derivedKey);

    final params = PaddedBlockCipherParameters(ParametersWithIV(keyParam, iv), null);
    final cipher = PaddedBlockCipherImpl(PKCS7Padding(), CBCBlockCipher(AESFastEngine()));
    cipher.init(true, params);

    final encoded = utf8.encode(plaintext);
    final encrypted = encoded.isEmpty ? Uint8List(0) : cipher.process(encoded as Uint8List?);
    final ciphertext = base64Url.encode(encrypted);
    return ciphertext;
  }

  String decrypt(String ciphertext, String password, Uint8List salt, Uint8List iv) {
    final derivedKey = (PBKDF2KeyDerivator(HMac(SHA1Digest(), 64))..init(Pbkdf2Parameters(salt, 1000, 32)))
        .process(utf8.encode(password) as Uint8List);
    final keyParam = KeyParameter(derivedKey);

    final params = PaddedBlockCipherParameters(ParametersWithIV(keyParam, iv), null);
    final cipher = PaddedBlockCipherImpl(PKCS7Padding(), CBCBlockCipher(AESFastEngine()));
    cipher.init(false, params);

    final decoded = base64Url.decode(ciphertext);
    final decrypted = decoded.isEmpty ? Uint8List(0) : cipher.process(decoded);
    final plaintext = utf8.decode(decrypted);
    return plaintext;
  }
}
