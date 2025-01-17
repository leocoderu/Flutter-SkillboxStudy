import 'package:flutter/material.dart';

BoxDecoration decorationTrackOn = BoxDecoration(
  borderRadius: BorderRadius.circular(12.0),
  border: Border.all(color: Color(0xFF201D26)),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF246C18), Color(0xFF3CB528), Color(0xFF3CB528), Color(0xFF5BBB4B)],
    stops: [0, 0.3, 0.7, 1],
  ),
);

BoxDecoration decorationTrackOff = BoxDecoration(
  borderRadius: BorderRadius.circular(12.0),
  border: Border.all(color: Color(0xFF201D26)),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF791711), Color(0xFFCA271D), Color(0xFFCA271D), Color(0xFFD5524A)],
    stops: [0, 0.3, 0.7, 1],
  ),
);

BoxDecoration decorationTrackWait = BoxDecoration(
  borderRadius: BorderRadius.circular(12.0),
  border: Border.all(color: Color(0xFF201D26)),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF201D26), Color(0xFF908E93), Color(0xFF908E93), Color(0xFFC7C7C9),],
    stops: [0, 0.3, 0.7, 1],
  ),
);

BoxDecoration decorationTrackDisabled = BoxDecoration(
  borderRadius: BorderRadius.circular(12.0),
  border: Border.all(color: Color(0xFF908393)),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF5A5A5A), Color(0xFF908E93), Color(0xFF908E93), Color(0xFFC7C7C9)],
    stops: [0, 0.3, 0.7, 1],
  ),
);

BoxDecoration decorationSliderOn = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(color: Color(0xFF201D26), strokeAlign: BorderSide.strokeAlignOutside),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF4F4F4), Color(0xFF908E93)],
    stops: [0, 1],
  ),
);

BoxDecoration decorationSliderOff = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(color: Color(0xFF201D26), strokeAlign: BorderSide.strokeAlignInside),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF4F4F4), Color(0xFF908E93)],
    stops: [0, 1],
  ),
);

BoxDecoration decorationSliderWait = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(color: Color(0xFF201D26), strokeAlign: BorderSide.strokeAlignOutside),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF4F4F4), Color(0xFF908E93)],
    stops: [0, 1],
  ),
);

BoxDecoration decorationSliderDisabled = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  border: Border.all(color: Color(0xFF908393), strokeAlign: BorderSide.strokeAlignOutside),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF908E93), Color(0xFFF4F4F4)],
    stops: [0, 1],
  ),
);

const TextStyle textStyleEnabled = TextStyle(
  color: Color(0xFF58565C),
  fontFamily: 'Exo2',
  fontSize: 13,
  fontWeight: FontWeight.w700,
);

const TextStyle textStyleDisabled = TextStyle(
  color: Color(0xFF908E93),
  fontFamily: 'Exo2',
  fontSize: 13,
  fontWeight: FontWeight.w700,
);