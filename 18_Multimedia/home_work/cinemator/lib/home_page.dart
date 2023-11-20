import 'package:cinemator/curtain.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  final TextEditingController _urlCtrl = TextEditingController();

  String url = 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';
  //String url = 'https://www.leocode.ru/VIDEO/scorpaena.mp4';

  double curPos = 0.00;
  bool showControl = true;
  bool curtain = true;

  @override
  void initState() {
    super.initState();
    _initVideo(url);
  }

  void _initVideo(String urls){
    _controller = VideoPlayerController.networkUrl(Uri.parse(urls));
    _controller.addListener(() => setState(() {
      curPos = _controller.value.position.inMicroseconds / _controller.value.duration.inMicroseconds;
    }));
    _controller.setLooping(true);
    _controller.initialize().then((value) => setState((){curtain = false;})).onError((error, stackTrace) => setState(() {curtain = true;}));
    if(curtain) _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String formatDuration(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "$twoDigitMinutes:$twoDigitSeconds";
    }

    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Cinemator'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: GestureDetector(
                onTap: () => setState(() => showControl = !showControl),
                child: Center(
                  child:
                    _controller.value.isInitialized
                    ? Container(
                      alignment: Alignment.center,
                      width: _controller.value.size.width / (_controller.value.aspectRatio * 1.215),
                      child: Stack(
                              children: [
                                AspectRatio(
                                  aspectRatio: _controller.value.aspectRatio,
                                  child: Center(child:VideoPlayer(_controller)),
                                ),
                                if(showControl)
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      color: const Color.fromARGB(150, 0, 0, 0),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Slider(value: curPos > 1 ? 1 : curPos,
                                                activeColor: Colors.blue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    curPos = value > 1 ? 1 : value;
                                                    _controller.seekTo(_controller.value.duration * curPos);
                                                  });
                                                }),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0),
                                              child: Row(
                                                children: [
                                                  Text(formatDuration(_controller.value.position), style: const TextStyle(color: Colors.white),),
                                                  const Expanded(child: SizedBox(),),
                                                  Text(formatDuration(_controller.value.duration), style: const TextStyle(color: Colors.white),),
                                                ],
                                              ),
                                            )
                                          ]
                                      ),
                                    )
                                ),
                                if(showControl)
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      cButton(const Icon(Icons.replay_10,), () {rewind_10Sec();}),
                                      _controller.value.isPlaying
                                          ? cButton(const Icon(Icons.pause), () {_controller.pause();})
                                          : cButton(const Icon(Icons.play_arrow), () {_controller.play();}),
                                      cButton(const Icon(Icons.forward_10), () {forward_10Sec();}),
                                    ],
                                  ),
                                )
                              ]
                        ),
                      )
                      : const Curtain(),
                ),
              )
          ),
          if(MediaQuery.orientationOf(context) == Orientation.portrait)
          TextField(
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter internet address here with .mp4',
              helperText: 'This is The field for enter address Video file from internet',
              labelText: 'Internet address',
            ),
            keyboardType: TextInputType.url,
            controller: _urlCtrl,
            onSubmitted: (text) {
              setState(() => url = text);
             _initVideo(url);
            },
          ),
        ]
      ),
    );
  }

  Widget cButton(Icon icon, Function onPres) {
    return IconButton(
      iconSize: 40,
      color: const Color.fromARGB(150, 0, 0, 0),
      onPressed: () {onPres();},
      icon: icon,
    );
  }

  Future<void> rewind_10Sec() async {
    final Duration? curPos = await _controller.position;
    if (curPos != null) await _controller.seekTo(curPos - const Duration(seconds: 10));
  }

  Future<void> forward_10Sec() async {
    final Duration? curPos = await _controller.position;
    if (curPos != null) await _controller.seekTo(curPos + const Duration(seconds: 10));
  }
}
