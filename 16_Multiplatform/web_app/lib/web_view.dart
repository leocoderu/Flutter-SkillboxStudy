import 'dart:html';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

Widget webView(String link) => WebPlatformWebView(link: link);


class WebPlatformWebView extends StatelessWidget {
  final String link;
  const WebPlatformWebView({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = Random().nextInt.toString();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(id, (int viewId) => IFrameElement()..src = link);
    return HtmlElementView(viewType: id);
  }
}