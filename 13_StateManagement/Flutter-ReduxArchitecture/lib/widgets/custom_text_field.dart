import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reduxdemo/core/constant/page_route_constants.dart';
import 'package:reduxdemo/core/resources/styles.dart' as MyTheme;

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final errorText;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final TextStyle hintStyle;
  final bool autoValidate;
  final textAlignment;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String> onFieldSubmitted;
  final ValueChanged<String> onChanged;

  CustomTextField({
    key,
    this.textEditingController,
    this.keyboardType,
    this.errorText,
    this.obscureText,
    this.textCapitalization,
    this.validator,
    this.inputFormatters,
    this.hintStyle,
    this.autoValidate = true,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
    this.textAlignment = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return TextFormField(
        focusNode: focusNode,
        textCapitalization: keyboardType == TextInputType.emailAddress
            ? TextCapitalization.none
            : TextCapitalization.sentences,
        textInputAction: textInputAction,
        controller: textEditingController,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: MyTheme.TextStyles.getMediumText(
            _width, MyTheme.Colors.black, PageRouteConstants.kRegular),
        textAlign: textAlignment,
        inputFormatters: inputFormatters,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: MyTheme.Colors.white,
          errorStyle: TextStyle(color: MyTheme.Colors.red),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: MyTheme.AppDimension.px1, color: MyTheme.Colors.red),
              borderRadius: BorderRadius.all(
                Radius.circular(MyTheme.AppDimension.px22),
              )),
          prefixStyle: MyTheme.TextStyles.getMediumText(
              _width, MyTheme.Colors.white, PageRouteConstants.kRegular),
          contentPadding: EdgeInsets.only(
              left: MyTheme.AppDimension.px16,
              top: MyTheme.AppDimension.px12,
              bottom: MyTheme.AppDimension.px12,
              right: MyTheme.AppDimension.px12),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(MyTheme.AppDimension.px22),
              ),
              borderSide: BorderSide(
                  color: MyTheme.Colors.black,
                  width: MyTheme.AppDimension.px1)),
        ),
        /*validator: validator,*/
        //define method here or in place of use
        validator: autoValidate
            ? validator ??
                (value) {
                  if (value.isEmpty) {
                    return errorText;
                  } else {
                    return value;
                  }
                }
            : null);
  }
}
