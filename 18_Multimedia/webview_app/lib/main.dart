import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ChromeSafariBrowser _chromeSafariBrowser = ChromeSafariBrowser();
  late InAppWebViewController _webViewController;
  final InAppLocalhostServer _localhostServer = InAppLocalhostServer();

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  @override
  void initState() {
    super.initState();
    _localhostServer.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: InAppWebView(
        onWebViewCreated: (controller) {
          _webViewController  = controller;
        },
        initialOptions: options,
        initialUrlRequest: URLRequest(
          url: Uri.parse("https://inappwebview.dev"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //_openRealBrowser();
          //_loadUrl();
          _loadLocalUrl();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _openRealBrowser(){
    _chromeSafariBrowser.open(url: Uri.parse("https://pub.dev"));
  }

  void _loadUrl() {
    _webViewController.loadUrl(urlRequest: URLRequest(url: Uri.parse("https://github.com/")));
  }

  void _loadLocalUrl() {
    _webViewController.loadUrl(urlRequest: URLRequest(url: Uri.parse("http://localhost:8080/assets/index.html")));
  }
}
