// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app_firebase_shop/ui/components/ui_text.dart';

class UiEmptyData extends StatelessWidget {
  final String text;

  const UiEmptyData({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiText(
            text: text,
            padding: const EdgeInsets.all(16),
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
