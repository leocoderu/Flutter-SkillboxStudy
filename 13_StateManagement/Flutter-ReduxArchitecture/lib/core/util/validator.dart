import 'package:reduxdemo/core/constant/regex_constant.dart';
import 'package:reduxdemo/core/constant/string_constant.dart';

class Validator {
  String validateEmail(String value) {
    RegExp regExp = RegExp(RegexConstant.valid_email);
    if (value.trim().length == 0) {
      return StringConstant.empty_email;
    } else if (!regExp.hasMatch(value)) {
      return StringConstant.invalid_email;
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length == 0) {
      return StringConstant.empty_password;
    }
    return null;
  }
}
