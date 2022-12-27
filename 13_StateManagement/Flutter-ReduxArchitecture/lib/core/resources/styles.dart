import 'package:flutter/material.dart';
import 'package:reduxdemo/core/constant/font_constants.dart';
import 'package:reduxdemo/core/constant/page_route_constants.dart';

class Colors {
  const Colors();

// Colors
  static const Color theme_orange = Color(0xffE47D2D);
  static const Color dark_grey = Color(0xff7e7e7d);

  static const Color red = Color(0xffff0000);
  static const Color white = Color(0xffffffff);
  static const Color disable_color = Color(0xff9b9b9b);
  static const Color black = Color(0xff000000);
}

class AppDimension {
  // AppDimension

  const AppDimension();

  static const double px1 = 1;
  static const double px150 = 150;
  static const double px16 = 16;
  static const double px12 = 12;
  static const double px22 = 22;
  static const double px13 = 13;
  static const double px14 = 14;
  static const double px21 = 21;
  static const double px18 = 18;
  static const double px17 = 17;
  static const double px25 = 25;
  static const double px26 = 26;
  static const double px29 = 29;
  static const double px30 = 30;
  static const double px20 = 20;
  static const double px56 = 56;
  static const double px8 = 8;
  static const double px10 = 10;
  static const double px28 = 28;
  static const double px4 = 4;
}

class TextStyles {
  /*-----------------------Text Style BOLD -----------------------*/
  static TextStyle getExtraSmallText(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == PageRouteConstants.kBold
          ? FontConstant.open_sans_bold
          : (fontType == PageRouteConstants.kSemiBold
              ? FontConstant.open_sans_semi_bold
              : (fontType == PageRouteConstants.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.025 < AppDimension.px14
          ? width * 0.025
          : AppDimension.px13),
    );
  }

  static TextStyle getSmallText(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == PageRouteConstants.kBold
          ? FontConstant.open_sans_bold
          : (fontType == PageRouteConstants.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == PageRouteConstants.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.038 < AppDimension.px18
          ? width * 0.038
          : AppDimension.px17),
    );
  }

  static TextStyle getMediumText(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == PageRouteConstants.kBold
          ? FontConstant.open_sans_bold
          : (fontType == PageRouteConstants.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == PageRouteConstants.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.044 < AppDimension.px22
          ? width * 0.044
          : AppDimension.px21),
    );
  }

  static TextStyle getLargeText(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == PageRouteConstants.kBold
          ? FontConstant.open_sans_bold
          : (fontType == PageRouteConstants.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == PageRouteConstants.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.053 < AppDimension.px26
          ? width * 0.053
          : AppDimension.px25),
    );
  }

  static TextStyle getExtraLargeText(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == PageRouteConstants.kBold
          ? FontConstant.open_sans_bold
          : (fontType == PageRouteConstants.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == PageRouteConstants.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.062 < AppDimension.px30
          ? width * 0.062
          : AppDimension.px29),
    );
  }

  static TextStyle getSmallTextUnderline(
      double width, Color color, int fontType, bool underline) {
    return TextStyle(
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      fontFamily: (fontType == PageRouteConstants.kBold
          ? FontConstant.open_sans_bold
          : (fontType == PageRouteConstants.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == PageRouteConstants.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.032 < AppDimension.px18
          ? width * 0.032
          : AppDimension.px17),
    );
  }

  static TextStyle getMedium1Text(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == PageRouteConstants.kBold
          ? FontConstant.open_sans_bold
          : (fontType == PageRouteConstants.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == PageRouteConstants.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.053 < AppDimension.px14
          ? width * 0.053
          : AppDimension.px13),
    );
  }
}
