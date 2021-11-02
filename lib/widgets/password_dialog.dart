/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/digests/sha1.dart';
import 'package:pointycastle/key_derivators/api.dart';
import 'package:pointycastle/key_derivators/pbkdf2.dart';
import 'package:pointycastle/macs/hmac.dart';

import '../generated/l10n.dart';
import '../util/confession_encryption.dart';

class PasswordDialog extends StatefulWidget {
  final String? passwordHash;
  final Uint8List? passwordSalt;
  final FutureOr<void> Function(String hash) storeNewPassword;

  const PasswordDialog({
    Key? key,
    required this.passwordHash,
    required this.passwordSalt,
    required this.storeNewPassword,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PasswordDialogState();
  }

  static Future<String?> show(
    BuildContext context, {
    required String hashKey,
    required String saltKey,
    FutureOr<void> Function()? onStoreNewPassword,
  }) async {
    final secureStorage = FlutterSecureStorage();

    final passwordHash = await secureStorage.read(key: hashKey);
    var passwordSalt = await secureStorage.read(key: saltKey);

    if (passwordSalt == null) {
      passwordSalt =
          base64Url.encode(ConfessionEncryptionHelper.rng.nextBytes(16));
      await secureStorage.write(key: saltKey, value: passwordSalt);
    }

    return showDialog<String>(
        context: context,
        builder: (context) => PasswordDialog(
              passwordHash: passwordHash,
              passwordSalt:
                  passwordSalt == null ? null : base64Url.decode(passwordSalt),
              storeNewPassword: (passwordHash) async {
                await secureStorage.write(key: hashKey, value: passwordHash);

                onStoreNewPassword!();
              },
            ));
  }
}

class _PasswordDialogState extends State<PasswordDialog> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final value = _passwordController.text;
      if (widget.passwordHash == null) {
        final hash =
            base64Url.encode(_hashPassword(value, widget.passwordSalt!));
        await widget.storeNewPassword(hash);
      }
      Navigator.pop(context, value);
    }
  }

  Uint8List _hashPassword(String password, Uint8List salt) {
    return (PBKDF2KeyDerivator(HMac(SHA1Digest(), 64))
          ..init(Pbkdf2Parameters(salt, 1000, 32)))
        .process(utf8.encode(password) as Uint8List);
  }

  @override
  Widget build(BuildContext context) {
    final strings = S.of(context);

    return AlertDialog(
      title: Text(strings.confession_password),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(widget.passwordHash != null
                ? strings.enter_password
                : strings.enter_new_password),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              textInputAction: TextInputAction.done,
              onEditingComplete: _submit,
              keyboardType: TextInputType.visiblePassword,
              autofocus: true,
              validator: (value) {
                final hash = base64Url
                    .encode(_hashPassword(value!, widget.passwordSalt!));
                if (widget.passwordHash != null &&
                    hash != widget.passwordHash) {
                  return strings.wrong_password;
                }

                return null;
              },
              decoration: InputDecoration(
                labelText: strings.password,
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, null),
          child: Text(strings.cancel),
        ),
        TextButton(
          onPressed: _submit,
          child: Text(strings.ok),
        )
      ],
    );
  }
}
