/*
 * Copyright (c) 2021. Bolldorf OG
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import "dart:async";

import "package:firebase_dynamic_links/firebase_dynamic_links.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:uni_links2/uni_links.dart";

class DeepLinkBuilder extends StatefulWidget {
  final Widget Function(BuildContext context) builder;

  const DeepLinkBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DeepLinkBuilderState();
}

class _DeepLinkBuilderState extends State<DeepLinkBuilder> {
  StreamSubscription<Uri?>? _linkSubscription;

  @override
  void initState() {
    super.initState();
    _initDynamicLinks();
  }

  void _initDynamicLinks() async {
    final deepLink = await getInitialUri();
    print("got initialLink: $deepLink");

    if (deepLink != null) {
      _processDeepLink(deepLink);
    }

    _linkSubscription = uriLinkStream.listen((Uri? deepLink) async {
      print("got deepLink: $deepLink");

      if (deepLink != null) {
        _processDeepLink(deepLink);
      }
    }, onError: (e) async {
      print("onLinkError");
      print(e);
    });
  }

  void _processDeepLink(Uri uri) async {
    final data = await FirebaseDynamicLinks.instance.getDynamicLink(uri);
    final deepLink = data?.link;

    if (deepLink != null) {
      await Navigator.pushNamed(context, deepLink.path, arguments: {
        "deepQuery": deepLink.queryParameters,
        "query": uri.queryParameters,
      });
    }
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
