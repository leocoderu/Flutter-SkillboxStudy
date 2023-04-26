// Flutter imports:
import 'package:flutter/material.dart';

class UiText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final TextAlign? textAlign;
  final bool? withOverflow;

  const UiText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.textAlign,
    this.withOverflow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Colors.grey[800],
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight,
        ),
        overflow: withOverflow == true ? TextOverflow.ellipsis : null,
        textAlign: textAlign,
      ),
    );
  }
}
