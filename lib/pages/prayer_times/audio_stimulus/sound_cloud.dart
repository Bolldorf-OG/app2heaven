/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SoundCloudWebView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SoundCloudWebViewState();
}

class _SoundCloudWebViewState extends State<SoundCloudWebView> {
  static const _soundCloudUrl =
      "https://w.soundcloud.com/player/?url=https://soundcloud.com/user-291560771/tracks&auto_play=false&buying=false&"
      "liking=false&download=false&sharing=false&show_artwork=false&show_comments=false&show_playcount=false&"
      "show_user=false&hide_related=false&visual=false";

  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: WebView(
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        initialUrl: _soundCloudUrl,
        javascriptMode: JavascriptMode.unrestricted,
        debuggingEnabled: true,
        onPageFinished: (url) {
          _controller?.evaluateJavascript(
              "document.querySelector('.mobilePrestitial__link').click()");
        },
      ),
    );
  }
}
