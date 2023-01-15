import 'package:flutter/material.dart';

class GroupBox extends StatelessWidget {
  final Widget child;

  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;

  final Color? textColor;
  final String? text;

  const GroupBox({
    Key? key,
    required this.child,
    this.borderRadius = 10.0,
    this.borderWidth = 1.0,
    this.borderColor,
    this.textColor,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: borderWidth, color: borderColor ?? Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: child,
          ),
        ),
        if(text?.isNotEmpty ?? false)
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
              ),
              clipBehavior: Clip.hardEdge,
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
              child: Text(text!, style: TextStyle(color: textColor ?? Theme.of(context).textTheme.bodyText1!.color),),
            ),
          ),
      ],
    );
  }
}

