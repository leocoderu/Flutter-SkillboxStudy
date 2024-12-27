import 'package:carousel_widgets/styles/app_colors.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.position, required this.length});

  final int position;
  final int length;


  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 50,
        left: 18,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < length; i++)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                    color: position == i ? blackColor200 : blackTransparent200,
                    borderRadius: BorderRadius.circular(50)),
              ),
          ],
        ),
    );
  }
}
