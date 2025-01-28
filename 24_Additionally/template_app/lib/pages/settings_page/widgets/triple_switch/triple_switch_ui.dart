// // Import Flutter
// import 'package:flutter/material.dart';
//
// import 'default_decoration_switch.dart';
//
// enum SwitchPosition {on, wait, off}
//
// class TripleSwitchUI extends StatelessWidget {
//   final switchPosition value;
//
//   final BoxDecoration? decorationTrackOn;
//   final BoxDecoration? decorationTrackOff;
//   final BoxDecoration? decorationTrackWait;
//   final BoxDecoration? decorationTrackDisabled;
//
//   final BoxDecoration? decorationSliderOn;
//   final BoxDecoration? decorationSliderOff;
//   final BoxDecoration? decorationSliderWait;
//   final BoxDecoration? decorationSliderDisabled;
//
//   final Size sizeTrack;
//   final Size sizeSlider;
//
//   final int?  timeout;
//   final String? textOn;
//   final String? textOff;
//   final String? textWait;
//   final String? textDisabled;
//   final TextStyle textStyleEnabled;
//   final TextStyle textStyleDisabled;
//
//   final ValueChanged<switchPosition>? onChanged;
//
//   const TripleSwitchUI({super.key,
//     this.value = switchPosition.on,
//     this.decorationTrackOn,
//     this.decorationTrackOff,
//     this.decorationTrackWait,
//     this.decorationTrackDisabled,
//     this.decorationSliderOn,
//     this.decorationSliderOff,
//     this.decorationSliderWait,
//     this.decorationSliderDisabled,
//     this.sizeTrack = const Size(60.0, 30.0),
//     this.sizeSlider = const Size(30.0, 30.0),
//     this.timeout,
//     this.textOn = '',
//     this.textOff = '',
//     this.textWait,
//     this.textDisabled = '',
//     this.textStyleEnabled = defaultTextStyleEnabled,
//     this.textStyleDisabled = defaultTextStyleDisabled,
//     this.onChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     BoxDecoration trackDecor;
//     BoxDecoration sliderDecor;
//     Alignment pos;
//     String? text;
//
//     switch (value) {
//         case switchPosition.on:
//           trackDecor = decorationTrackOn ?? defaultDecorationTrackOn;
//           sliderDecor = decorationSliderOn ?? defaultDecorationSliderOn;
//           pos = Alignment.centerRight;
//           text = textOn;
//           break;
//
//         case switchPosition.wait:
//           trackDecor = decorationTrackWait ?? defaultDecorationTrackWait;
//           sliderDecor = decorationSliderWait ?? defaultDecorationSliderWait;
//           pos = Alignment.center;
//           text = textWait ?? timeout.toString(); // (timeout != null ? timeout.toString() : '');
//           break;
//
//         case switchPosition.off:
//           trackDecor = decorationTrackOff ?? defaultDecorationTrackOff;
//           sliderDecor = decorationSliderOff ?? defaultDecorationSliderOff;
//           pos = Alignment.centerLeft;
//           text = textOff;
//           break;
//     }
//
//     return GestureDetector(
//       onTap: () {
//         if (onChanged != null) {
//           switchPosition newPos = value == switchPosition.on ? switchPosition.off : switchPosition.on;
//           timeout == null
//               ? onChanged!(newPos)
//               : onChanged!(switchPosition.wait);
//         }
//       },
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 200),
//         decoration: onChanged != null ? trackDecor : defaultDecorationTrackDisabled,
//         alignment: onChanged != null ? pos : Alignment.center,
//         width: sizeTrack.width,
//         height: sizeTrack.height,
//         child: Container(
//           decoration: onChanged != null ? sliderDecor : defaultDecorationSliderDisabled,
//           alignment: Alignment.center,
//           width:  sizeSlider.width,
//           height: sizeSlider.height,
//           child: Text('${onChanged != null ? (text ?? '') : textDisabled}',
//             style: onChanged != null ? textStyleEnabled : textStyleDisabled,
//           ),
//         ),
//       ),
//     );
//   }
// }
