import 'package:flutter/material.dart';

class Tabbar1 extends StatefulWidget {
  const Tabbar1({Key? key}) : super(key: key);

  @override
  State<Tabbar1> createState() => _Tabbar1State();
}

class _Tabbar1State extends State<Tabbar1>
    with AutomaticKeepAliveClientMixin {     /// Using the mixin
  @override
  Widget build(BuildContext context) {
    super.build(context);    /// Calling build method of mixin
    //print("Tabbar 1 build");
    return Scaffold(
      appBar: AppBar(title: const Text("Tab bar 1")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${index + 1}"),
          );
        },
        itemCount: 50,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;    /// Overriding the value to preserve the state
}