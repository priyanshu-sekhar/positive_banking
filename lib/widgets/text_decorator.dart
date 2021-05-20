import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextDecorator {
  static InputDecoration textFieldDecoration({String hintText, errorText}) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(10),
      focusedBorder: textFieldBorder(),
      enabledBorder: textFieldBorder(),
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
      errorText: errorText,
    );
  }

  static OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.black45));
  }
}