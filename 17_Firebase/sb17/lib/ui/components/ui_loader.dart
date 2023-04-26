// Flutter imports:
import 'package:flutter/material.dart';

const double _appLoaderBasePadding = 8.0;
const double _appLoaderBaseStrokeWidth = 4.0;

class UiLoader extends StatelessWidget {
  final Color? color;
  final double? padding, size, strokeWidth;

  const UiLoader({
    super.key,
    this.color,
    this.padding,
    this.size,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding ?? _appLoaderBasePadding),
        child: SizedBox(
          height: size,
          width: size,
          child: CircularProgressIndicator(
            color: color ?? Colors.green,
            strokeWidth: strokeWidth ?? _appLoaderBaseStrokeWidth,
          ),
        ),
      ),
    );
  }
}
