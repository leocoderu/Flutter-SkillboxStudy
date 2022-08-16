import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Tabbar2 extends StatefulWidget {
  const Tabbar2({Key? key}) : super(key: key);

  @override
  State<Tabbar2> createState() => _Tabbar2State();
}

class _Tabbar2State extends State<Tabbar2>
    with SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin{
  late final Ticker _ticker;
  Duration _escapedDuration = Duration.zero;

  get escapedSeconds => _escapedDuration.inSeconds.toString();

  @override
  void initState() {
    super.initState();
    //print("Tabbar 2 initState");

    _ticker = createTicker((elapsed) {
      if (elapsed.inSeconds - _escapedDuration.inSeconds == 1) {
        setState(() {
          _escapedDuration = elapsed;
        });
      }
    });

    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);     /// Calling build method of mixin
    return Scaffold(
      appBar: AppBar(title: const Text("Tab bar 2")),
      body: Center(
        child: Text(escapedSeconds),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;   /// Overriding the value to preserve the state
}