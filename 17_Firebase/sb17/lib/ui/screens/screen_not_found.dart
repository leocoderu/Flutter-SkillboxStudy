// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app_firebase_shop/consts/keys.dart';
import 'package:app_firebase_shop/consts/translations.dart';
import 'package:app_firebase_shop/ui/components/ui_header.dart';
import 'package:app_firebase_shop/ui/components/ui_text.dart';

class ScreenNotFound extends StatelessWidget {
  const ScreenNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiHeader(
        title: labelsNotFound[keyTitle]!,
      ),
      body: SafeArea(
        child: Center(
          child: UiText(
            text: labelsNotFound[keyContent]!,
          ),
        ),
      ),
    );
  }
}
