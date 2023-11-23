import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late InAppWebViewController _webViewController;
  final TextEditingController _ctrUrl = TextEditingController(text: 'https://ya.ru');

  double progress = 0;
  bool canBack = false;
  bool canForward = false;
  bool isLoading = false;
  String url = 'https://ya.ru';


  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      javaScriptCanOpenWindowsAutomatically: true,
      supportZoom: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Palantir WebView'), centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => _webViewController.goBack(),
                    icon: const Icon(Icons.arrow_back),
                    color: canBack ? Colors.black : Colors.black12,
                  ),
                  IconButton(
                    onPressed: () {_webViewController.goForward();},
                    icon: const Icon(Icons.arrow_forward),
                    color: canForward == true ? Colors.black : Colors.black12,
                  ),
                  IconButton(
                    onPressed: () {_webViewController.reload();},
                    icon: isLoading ? const Icon(Icons.stop) : const Icon(Icons.refresh),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _ctrUrl,
                      onEditingComplete: (){
                        setState(() => url = _ctrUrl.text);
                        _webViewController.loadUrl(urlRequest: URLRequest(url: Uri.parse(url)));
                      },
                    ),
                  ),
                ],
              )
            ),
            Expanded(
              child: InAppWebView(
                onWebViewCreated: (controller) => _webViewController = controller,
                initialOptions: options,
                initialUrlRequest: URLRequest(url: Uri.parse(url)),
                onProgressChanged: (controller, progress) =>
                  setState(() => this.progress = progress / 100),
                onLoadStart: (control, uri) {
                  setState(() => isLoading = true);
                },
                onLoadStop: (control, uri) async {
                  bool res = await _webViewController.canGoBack();
                  setState(() => canBack = res);
                  res = await _webViewController.canGoForward();
                  setState(() => canForward = res);
                  setState(() => isLoading = false);
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}
