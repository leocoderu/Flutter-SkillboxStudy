import 'package:flutter/material.dart';

enum switchPosition {on, wait, off}

class TripleSwitch extends StatelessWidget {
  final switchPosition value;

  final BoxDecoration? decorationTrackOn;
  final BoxDecoration? decorationTrackOff;
  final BoxDecoration? decorationTrackWait;
  final BoxDecoration? decorationTrackDisabled;

  final BoxDecoration? decorationSliderOn;
  final BoxDecoration? decorationSliderOff;
  final BoxDecoration? decorationSliderWait;
  final BoxDecoration? decorationSliderDisabled;

  final Size? sizeTrack;
  final Size? sizeSlider;

  final bool? enabled;
  final int?  timeout;
  final String? textOn;
  final String? textOff;
  final String? textWait;
  final String? textDisabled;
  final TextStyle? textStyleEnabled;
  final TextStyle? textStyleDisabled;

  //final ValueChanged<switchPosition> onTap;
  final VoidCallback onTap;

  const TripleSwitch({super.key,
    required this.value,
    this.decorationTrackOn,
    this.decorationTrackOff,
    this.decorationTrackWait,
    this.decorationTrackDisabled,
    this.decorationSliderOn,
    this.decorationSliderOff,
    this.decorationSliderWait,
    this.decorationSliderDisabled,
    this.sizeTrack,
    this.sizeSlider,
    this.enabled,
    this.timeout,
    this.textOn,
    this.textOff,
    this.textWait,
    this.textDisabled,
    this.textStyleEnabled,
    this.textStyleDisabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    BoxDecoration? getDecorTrack(switchPosition v) {
      switch (v) {
        case switchPosition.on:
          return decorationTrackOn;
        case switchPosition.off:
          return decorationTrackOff;
        case switchPosition.wait:
          return decorationTrackWait;
      }
    }

    BoxDecoration? getDecorSlider(switchPosition v) {
      switch (v) {
        case switchPosition.on:
          return decorationSliderOn;
        case switchPosition.off:
          return decorationSliderOff;
        case switchPosition.wait:
          return decorationSliderWait;
      }
    }

    Alignment getPos(switchPosition v) {
      switch (v) {
        case switchPosition.on:
          return Alignment.centerRight;
        case switchPosition.off:
          return Alignment.centerLeft;
        case switchPosition.wait:
          return Alignment.center;
      }
    }

    String getText(switchPosition v) {
      switch (v) {
        case switchPosition.on:
          return textOn ?? '';
        case switchPosition.off:
          return textOff ?? '';
        case switchPosition.wait:
          return textWait ?? '';
      }
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: (enabled ?? true) ? getDecorTrack(value) : decorationTrackDisabled,
        alignment: (enabled ?? true) ? getPos(value) : Alignment.center,
        width: sizeTrack != null ? sizeTrack!.width : 60.0,
        height: sizeTrack != null ? sizeTrack!.height : 30.0,
        child: Container(
          decoration: (enabled ?? true) ? getDecorSlider(value) : decorationSliderDisabled,
          alignment: Alignment.center,
          width:  sizeTrack != null ? ((sizeTrack!.height > sizeTrack!.width) ? sizeTrack!.width : sizeTrack!.height) : 30.0,
          height: sizeTrack != null ? ((sizeTrack!.height > sizeTrack!.width) ? sizeTrack!.width : sizeTrack!.height) : 30.0,
          child: Text('${(enabled ?? true) ? getText(value) : textDisabled}',
            style: (enabled ?? true) ? textStyleEnabled : textStyleDisabled,
          ),
        ),
      ),
    );
  }
}
