import 'package:flutter/material.dart';
import 'package:carousel_widgets/styles/app_colors.dart';

ButtonStyle outlinedButtonStyle = ButtonStyle(
  padding: const WidgetStatePropertyAll(EdgeInsets.all(10.0)),
  foregroundColor: const WidgetStatePropertyAll(whiteColor100),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3.0),
    ),
  ),
);

ButtonStyle outlined2ButtonStyle = ButtonStyle(
  minimumSize: const WidgetStatePropertyAll(Size(168, 60)),
  padding: const WidgetStatePropertyAll(EdgeInsets.all(10.0)),
  foregroundColor: const WidgetStatePropertyAll(blackColor550),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(9.0),
    ),
  ),
);

ButtonStyle elevatedButtonDefaultStyle = ButtonStyle(
  padding: const WidgetStatePropertyAll(EdgeInsets.all(10.0)),
  foregroundColor: const WidgetStatePropertyAll(whiteColor100),
  backgroundColor: const WidgetStatePropertyAll(blackColor400),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3.0),
    ),
  ),
);

ButtonStyle elevatedButton2DefaultStyle = ButtonStyle(
  padding: const WidgetStatePropertyAll(EdgeInsets.all(10.0)),
  foregroundColor: const WidgetStatePropertyAll(whiteColor100),
  backgroundColor: const WidgetStatePropertyAll(blackColor500),
  minimumSize: const WidgetStatePropertyAll(Size(326.0, 56.0)),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(9.0),
    ),
  ),
);

ButtonStyle elevatedRadioButtonEnableStyle = ButtonStyle(
  padding: const WidgetStatePropertyAll(EdgeInsets.all(10.0)),
  foregroundColor: const WidgetStatePropertyAll(whiteColor100),
  backgroundColor: const WidgetStatePropertyAll(blackColor400),
  minimumSize: const WidgetStatePropertyAll(Size(119.0, 44.0)),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(11.0),
    ),
  ),
);

ButtonStyle elevatedRadioButtonDisableStyle = ButtonStyle(
  padding: const WidgetStatePropertyAll(EdgeInsets.all(10.0)),
  foregroundColor: const WidgetStatePropertyAll(blackColor600),
  backgroundColor: const WidgetStatePropertyAll(blackColor100),
  minimumSize: const WidgetStatePropertyAll(Size(119.0, 44.0)),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(11.0),
    ),
  ),
);
