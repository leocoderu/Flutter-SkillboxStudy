import 'package:flutter/material.dart';
import 'package:js_interop_app/platform/platform_widget.dart';

class PlatformWidgetImpl extends StatelessWidget implements PlatformWidget{
  const PlatformWidgetImpl({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      width: 200,
      child: Text('Platform is not supported'),
    );
  }
}
