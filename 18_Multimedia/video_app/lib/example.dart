import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

main() {
  runApp(const MaterialApp(
    home: VideoPlayerDemo(),
  ));
}

class VideoPlayerDemo extends StatefulWidget {
  const VideoPlayerDemo({super.key});

  @override
  State<VideoPlayerDemo> createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {
  int index = 0;
  double _position = 0;
  double _buffer = 0;
  bool _lock = true;
  final Map<String, VideoPlayerController> _controllers = {};
  final Map<int, VoidCallback> _listeners = {};
  static const _urls = {
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4#1',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4#2',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4#3',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4#4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4#5',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4#6',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4#7',
  };

  @override
  void initState() {
    super.initState();

    if (_urls.isNotEmpty) {
      _initController(0).then((_) {
        _playController(0);
      });
    }

    if (_urls.length > 1) {
      _initController(1).whenComplete(() => _lock = false);
    }
  }

  VoidCallback _listenerSpawner(index) {
    return () {
      int dur = _controller(index).value.duration.inMilliseconds;
      int pos = _controller(index).value.position.inMilliseconds;
      int buf = _controller(index).value.buffered.last.end.inMilliseconds;

      setState(() {
        if (dur <= pos) {
          _position = 0;
          return;
        }
        _position = pos / dur;
        _buffer = buf / dur;
      });
      if (dur - pos < 1) {
        if (index < _urls.length - 1) {
          _nextVideo();
        }
      }
    };
  }

  VideoPlayerController _controller(int index) {
    return _controllers[_urls.elementAt(index)]!;
  }

  Future<void> _initController(int index) async {
    final url = Uri.parse(_urls.elementAt(index));
    var controller = VideoPlayerController.networkUrl(url);
    _controllers[_urls.elementAt(index)] = controller;
    await controller.initialize();
  }

  void _removeController(int index) {
    _controller(index).dispose();
    _controllers.remove(_urls.elementAt(index));
    _listeners.remove(index);
  }

  void _stopController(int index) {
    _controller(index).removeListener(_listeners[index]!);
    _controller(index).pause();
    _controller(index).seekTo(const Duration(milliseconds: 0));
  }

  void _playController(int index) async {
    if (!_listeners.keys.contains(index)) {
      _listeners[index] = _listenerSpawner(index);
    }
    _controller(index).addListener(_listeners[index]!);
    await _controller(index).play();
    setState(() {});
  }

  void _previousVideo() {
    if (_lock || index == 0) {
      return;
    }
    _lock = true;

    _stopController(index);

    if (index + 1 < _urls.length) {
      _removeController(index + 1);
    }

    _playController(--index);

    if (index == 0) {
      _lock = false;
    } else {
      _initController(index - 1).whenComplete(() => _lock = false);
    }
  }

  void _nextVideo() async {
    if (_lock || index == _urls.length - 1) {
      return;
    }
    _lock = true;

    _stopController(index);

    if (index - 1 >= 0) {
      _removeController(index - 1);
    }

    _playController(++index);

    if (index == _urls.length - 1) {
      _lock = false;
    } else {
      _initController(index + 1).whenComplete(() => _lock = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Playing ${index + 1} of ${_urls.length}"),
      ),
      body: Stack(
        children: <Widget>[
          GestureDetector(
            onLongPressStart: (_) => _controller(index).pause(),
            onLongPressEnd: (_) => _controller(index).play(),
            child: Center(
              child: AspectRatio(
                aspectRatio: _controller(index).value.aspectRatio,
                child: Center(child: VideoPlayer(_controller(index))),
              ),
            ),
          ),
          Positioned(
            child: Container(
              height: 10,
              width: MediaQuery.of(context).size.width * _buffer,
              color: Colors.grey,
            ),
          ),
          Positioned(
            child: Container(
              height: 10,
              width: MediaQuery.of(context).size.width * _position,
              color: Colors.greenAccent,
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _previousVideo,
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 24),
          FloatingActionButton(
            onPressed: _nextVideo,
            child: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}