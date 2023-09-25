import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
  late VideoPlayerController _controller;

  static const _urls = {
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  };

  @override
  void initState() {
    super.initState();
    //_controller = VideoPlayerController.asset('assets/Butterfly-209.mp4', closedCaptionFile: _loadCaptions(),);
    // final url = Uri.parse(_urls.elementAt(0));
    _controller = VideoPlayerController.networkUrl(Uri.parse(_urls.elementAt(0)), closedCaptionFile: _loadCaptions(),);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Video Player'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 200.0,
        child: Stack(
          children: [
            VideoPlayer(_controller),
            ClosedCaption(text: _controller.value.caption.text),
            Align(
              alignment: Alignment.bottomCenter,
              child: VideoProgressIndicator(_controller, allowScrubbing: true,),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {_controller.pause();},
                      icon: const Icon(Icons.pause,),
                    ),
                    IconButton(
                      onPressed: () {_controller.play();},
                      icon: const Icon(Icons.play_arrow,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Future<ClosedCaptionFile> _loadCaptions() async {
    final String fileContents = await DefaultAssetBundle.of(context).loadString('assets/bumble_bee_caption.vtt');
    return WebVTTCaptionFile(fileContents);
  }
}
