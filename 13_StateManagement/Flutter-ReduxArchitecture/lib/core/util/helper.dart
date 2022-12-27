import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:reduxdemo/core/constant/string_constant.dart';
import 'package:reduxdemo/core/resources/styles.dart' as MyTheme;

class Helper {
  static var logger = Logger();

  static printLogValue(dynamic value) {
    logger.d(value.toString());
  }

  static void showMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: MyTheme.Colors.theme_orange,
        textColor: MyTheme.Colors.white,
        fontSize: MyTheme.AppDimension.px16);
  }

  static void errorDialog(BuildContext context, String title, String errorMsg) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          content: Text(errorMsg),
          actions: <Widget>[
            FlatButton(
              child: Text(StringConstant.ok),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static Widget progressWidget(GlobalKey progressKey) {
    return Container(
        height: MyTheme.AppDimension.px56,
        child: Center(
          child: CircularProgressIndicator(
            key: progressKey,
          ),
        ));
  }
}
