import 'package:flutter/material.dart';

enum switchPosition {on, wait, off}

class TripleSwitch extends StatelessWidget {
  final switchPosition value;
  final BoxDecoration? decorationTrack;
  final BoxDecoration? decorationSlider;
  final Size? sizeTrack;
  final Size? sizeSlider;
  final bool? enabled;
  final int?  timeout;
  final String? text;
  final TextStyle? textStyle;

  const TripleSwitch({super.key,
    required this.value,
    this.decorationTrack,
    this.decorationSlider,
    required this.sizeTrack,
    required this.sizeSlider,
    this.enabled,
    this.timeout,
    this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decorationTrack,
      width: sizeTrack != null ? sizeTrack!.width : 50.0,
      height: sizeTrack != null ? sizeTrack!.height : 25.0,
    );
  }
}
