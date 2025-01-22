import 'dart:async';

import 'package:flutter/material.dart';

import 'decoration_switch.dart';

enum switchPosition {on, wait, off}

class TripleSwitch extends StatefulWidget {
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

  final int?  timeout;
  final String? textOn;
  final String? textOff;
  final String? textWait;
  final String? textDisabled;
  final TextStyle textStyleEnabled;
  final TextStyle textStyleDisabled;

  final ValueChanged<switchPosition>? onChanged;

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
    this.timeout,
    this.textOn = '',
    this.textOff = '',
    this.textWait = '',
    this.textDisabled = '',
    this.textStyleEnabled = defaultTextStyleEnabled,
    this.textStyleDisabled = defaultTextStyleDisabled,
    this.onChanged,
  });

  @override
  State<TripleSwitch> createState() => _TripleSwitchState();
}

class _TripleSwitchState extends State<TripleSwitch> {

  late int? timeOut;
  late Timer _timer;

  @override
  void initState() {
    timeOut = widget.timeout;

    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => tick());

    super.initState();
  }

  void tick() {
    setState(() {
      if (timeOut != null) {
        timeOut = timeOut! - 1;
        if (timeOut! < 0) timeOut = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration trackDecor;
    BoxDecoration sliderDecor;
    Alignment pos;
    String text;

    switch (widget.value) {
        case switchPosition.on:
          trackDecor = widget.decorationTrackOn ?? defaultDecorationTrackOn;
          sliderDecor = widget.decorationSliderOn ?? defaultDecorationSliderOn;
          pos = Alignment.centerRight;
          text = widget.textOn ?? '';
          break;

        case switchPosition.wait:
          trackDecor = widget.decorationTrackWait ?? defaultDecorationTrackWait;
          sliderDecor = widget.decorationSliderWait ?? defaultDecorationSliderWait;
          pos = Alignment.center;
          text = widget.textWait ?? (timeOut != null ? 'TT'/*timeOut.toString()*/ : 'ZZ');
          break;

        case switchPosition.off:
          trackDecor = widget.decorationTrackOff ?? defaultDecorationTrackOff;
          sliderDecor = widget.decorationSliderOff ?? defaultDecorationSliderOff;
          pos = Alignment.centerLeft;
          text = widget.textOff ?? '';
          break;
    }

    switchPosition _getSwitchPos() {
      if (timeOut == null) {
        if (widget.value == switchPosition.wait) print('It was wait!!!');
        return widget.value == switchPosition.on
            ? switchPosition.off
            : switchPosition.on;
      }
      return switchPosition.wait;
    }

    return GestureDetector(
      onTap: () => widget.onChanged != null ? widget.onChanged!(_getSwitchPos()) : null,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: widget.onChanged != null ? trackDecor : defaultDecorationTrackDisabled,
        alignment: widget.onChanged != null ? pos : Alignment.center,
        width: widget.sizeTrack.width,
        height: widget.sizeTrack.height,
        child: Container(
          decoration: widget.onChanged != null ? sliderDecor : defaultDecorationSliderDisabled,
          alignment: Alignment.center,
          width:  widget.sizeSlider.width,
          height: widget.sizeSlider.height,
          child: Text('${widget.onChanged != null ? text : widget.textDisabled}',
            style: widget.onChanged != null ? widget.textStyleEnabled : widget.textStyleDisabled,
          ),
        ),
      ),
    );
  }
}
