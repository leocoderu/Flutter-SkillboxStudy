import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app/app_platform.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget webView(String  link) => AppPlatform.isMobile
    ? WebView(initialUrl: link)
    : Hyperlink(link: link);

class Hyperlink extends StatelessWidget {
  final  String link;

  const Hyperlink({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Text(
          link,
          style: const TextStyle(
            decoration: TextDecoration.underline,
            color: Colors.blue,
          ),
        ),
      ),
      onTap: () {
        launch(link);
      },
    );
  }
}