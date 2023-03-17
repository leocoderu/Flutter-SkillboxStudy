import 'package:flutter/material.dart';

InputDecoration inputDecor = const InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 3.0),
    borderRadius: BorderRadius.zero,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 3.0),
    borderRadius: BorderRadius.zero,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 3.0),
    borderRadius: BorderRadius.zero,
  ),
  contentPadding: EdgeInsets.all(5.0),
);

TextStyle inputStyle = const TextStyle(
  fontFamily: 'Prompt',
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

ButtonStyle btnStyle = ElevatedButton.styleFrom(
  shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
  ),
  textStyle: const TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Prompt'
    ),
  minimumSize: const Size(60, 45),
);

TextStyle headerStyle = const TextStyle(
  fontFamily: 'Prompt',
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

TextStyle corsStyle = const TextStyle(
  color: Colors.red,
  fontFamily: 'Prompt',
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

TextStyle footerStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'Prompt'
);