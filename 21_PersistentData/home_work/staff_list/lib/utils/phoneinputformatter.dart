import 'package:flutter/services.dart';

// 123 456 78 90

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digitOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    final initialSpeshialSimbolCount = newValue.selection
      .textBefore(newValue.text)
      .replaceAll(RegExp(r'[\d]+'), '')
      .length;
    final cursorPosition = newValue.selection.start - initialSpeshialSimbolCount;
    var finaCursorPosition = cursorPosition;
    final digitOnlyChars = digitOnly.split('');

    if(oldValue.text.length - newValue.text.length == 1 && oldValue.selection.textInside(oldValue.text) == ' '){
      digitOnlyChars.removeAt(cursorPosition - 1);
      finaCursorPosition -= 2;
    }

    var newString = <String>[];
    for(var i = 0; i < digitOnlyChars.length; i++){
      if ((i == 3) || (i == 6) || (i == 8)) {
        newString.add(' ');
        newString.add(digitOnlyChars[i]);
        if(i <= cursorPosition) finaCursorPosition++;
      } else {
        newString.add(digitOnlyChars[i]);
      }
    }

    return TextEditingValue(
      text: newString.join(''),
      selection: TextSelection.collapsed(offset: finaCursorPosition),
    );
  }
  
}