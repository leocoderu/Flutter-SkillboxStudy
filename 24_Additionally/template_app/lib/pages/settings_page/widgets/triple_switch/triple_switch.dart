import 'package:flutter/material.dart';

import 'decoration_switch.dart';

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

  final Size sizeTrack;
  final Size sizeSlider;

  final bool enabled;
  final int?  timeout;
  final String textOn;
  final String textOff;
  final String textWait;
  final String textDisabled;
  final TextStyle textStyleEnabled;
  final TextStyle textStyleDisabled;

  final VoidCallback? onTap;

  const TripleSwitch({super.key,
    this.value = switchPosition.on,
    this.decorationTrackOn,
    this.decorationTrackOff,
    this.decorationTrackWait,
    this.decorationTrackDisabled,
    this.decorationSliderOn,
    this.decorationSliderOff,
    this.decorationSliderWait,
    this.decorationSliderDisabled,
    this.sizeTrack = const Size(60.0, 30.0),
    this.sizeSlider = const Size(30.0, 30.0),
    this.enabled = true,
    this.timeout,
    this.textOn = '',
    this.textOff = '',
    this.textWait = '',
    this.textDisabled = '',
    this.textStyleEnabled = defaultTextStyleEnabled,
    this.textStyleDisabled = defaultTextStyleDisabled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    BoxDecoration trackDecor;
    BoxDecoration sliderDecor;
    Alignment pos;
    String text;

    switch (value) {
        case switchPosition.on:
          trackDecor = decorationTrackOn ?? defaultDecorationTrackOn;
          sliderDecor = decorationSliderOn ?? defaultDecorationSliderOn;
          pos = Alignment.centerRight;
          text = textOn;
          break;

        case switchPosition.off:
          trackDecor = decorationTrackOff ?? defaultDecorationTrackOff;
          sliderDecor = decorationSliderOff ?? defaultDecorationSliderOff;
          pos = Alignment.centerLeft;
          text = textOff;
          break;

        case switchPosition.wait:
          trackDecor = decorationTrackWait ?? defaultDecorationTrackWait;
          sliderDecor = decorationSliderWait ?? defaultDecorationSliderWait;
          pos = Alignment.center;
          text = textWait;
          break;
    }

    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        decoration: enabled ? trackDecor : defaultDecorationTrackDisabled,
        alignment: enabled ? pos : Alignment.center,
        width: sizeTrack.width,
        height: sizeTrack.height,
        child: Container(
          decoration: enabled ? sliderDecor : defaultDecorationSliderDisabled,
          alignment: Alignment.center,
          width:  sizeSlider.width,
          height: sizeSlider.height,
          child: Text('${enabled ? text : textDisabled}',
            style: enabled ? textStyleEnabled : textStyleDisabled,
          ),
        ),
      ),
    );
  }
}
