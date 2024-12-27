import 'package:flutter/material.dart';
import 'package:carousel_widgets/styles/app_colors.dart';
import 'package:carousel_widgets/styles/button_style.dart';
import 'package:carousel_widgets/styles/font_style.dart';

class OneBanner extends StatelessWidget {
  const OneBanner({super.key, this.imagePath, this.label, this.text, this.description, required this.onPressed});

  final String? imagePath;
  final String? label;
  final String? text;
  final String? description;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: (imagePath != null)
        ? DecorationImage(
          image: AssetImage(imagePath!),
          fit: BoxFit.cover,
        )
        : null,
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x00000000), Color(0xFF2C2C2C)],
            stops: [0.5, 1],
          ),
        ),
        child: Column(
          children: [
            Expanded(child: Container()),
            Container(
              padding: const EdgeInsets.all(19.0),
              height: 140,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      //color: Colors.lime,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: double.infinity, child: Text(label ?? '',
                            style: header1TextStyle.copyWith(color: whiteColor100),),
                          ),
                          SizedBox(width: double.infinity, child: Text(text ?? '',
                            style: textAdsTextStyle.copyWith(color: whiteColor100),),),
                          SizedBox(width: double.infinity, child: Text(description ?? '',
                            style: textAdsTextStyle.copyWith(color: whiteColor100),),),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      //color: Colors.deepOrange,
                      alignment: Alignment.bottomLeft,
                      child: OutlinedButton(
                        style: outlinedButtonStyle,
                        onPressed: onPressed,
                        child: Text('Перейти к акции', style: buttonTextStyle.copyWith(color: whiteColor100),),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
