// Import Flutter
import 'package:flutter/material.dart';

// Import Modules
import '../triple_switch.dart';
import 'default_decoration_switch.dart';

class TripleSwitchUI extends StatelessWidget {
  final SwitchPosition? position;

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

  final int?  timeout;
  final String? textOn;
  final String? textOff;
  final String? textWait;
  final String? textDisabled;
  final TextStyle? textStyleEnabled;
  final TextStyle? textStyleDisabled;

  final ValueChanged<SwitchPosition>? onChanged;

  const TripleSwitchUI({super.key,
    this.position,
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
    this.timeout,
    this.textOn,
    this.textOff,
    this.textWait,
    this.textDisabled,
    this.textStyleEnabled = defaultTextStyleEnabled,
    this.textStyleDisabled = defaultTextStyleDisabled,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    BoxDecoration trackDecor;
    BoxDecoration sliderDecor;
    Alignment pos;
    String? text;

    switch (position ?? SwitchPosition.off) {
      case SwitchPosition.on:
        trackDecor = decorationTrackOn ?? defaultDecorationTrackOn;
        sliderDecor = decorationSliderOn ?? defaultDecorationSliderOn;
        pos = Alignment.centerRight;
        text = textOn;
        break;

      case SwitchPosition.wait:
        trackDecor = decorationTrackWait ?? defaultDecorationTrackWait;
        sliderDecor = decorationSliderWait ?? defaultDecorationSliderWait;
        pos = Alignment.center;
        text = textWait ?? timeout.toString();
        break;

      case SwitchPosition.off:
        trackDecor = decorationTrackOff ?? defaultDecorationTrackOff;
        sliderDecor = decorationSliderOff ?? defaultDecorationSliderOff;
        pos = Alignment.centerLeft;
        text = textOff;
        break;
    }

    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          SwitchPosition newPos = position == SwitchPosition.on ? SwitchPosition.off : SwitchPosition.on;
          timeout == null
              ? onChanged!(newPos)
              : onChanged!(SwitchPosition.wait);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: onChanged != null ? trackDecor : defaultDecorationTrackDisabled,
        alignment: onChanged != null ? pos : Alignment.center,
        width: sizeTrack != null ? sizeTrack!.width : 60.0,
        height: sizeTrack != null ? sizeTrack!.height : 30.0,
        child: Container(
          decoration: onChanged != null ? sliderDecor : defaultDecorationSliderDisabled,
          alignment: Alignment.center,
          width:  sizeSlider != null ? sizeSlider!.width : 30.0,
          height: sizeSlider != null ? sizeSlider!.height : 30.0,
          child: Text(onChanged != null ? (text ?? '') : (textDisabled ?? ''),
            style: onChanged != null ? textStyleEnabled : textStyleDisabled,
          ),
        ),
      ),
    );
  }
}
