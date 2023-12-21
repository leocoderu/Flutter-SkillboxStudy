import 'package:flutter/material.dart';
import 'package:js_interop_app/platform/platform_widget.dart';

class PlatformWidgetImpl extends StatelessWidget implements PlatformWidget{
  const PlatformWidgetImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: HtmlElementView(
        viewType: 'web-button',
        onPlatformViewCreated: _onPlatformViewCreated,
      ),
    );
  }

  void _onPlatformViewCreated(int id) {
    // ignore: avoid_print
    print('Platform with id:$id created');
  }
}