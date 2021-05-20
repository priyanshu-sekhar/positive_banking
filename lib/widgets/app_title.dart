import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final double fontSize;

  AppTitle({this.fontSize});

  @override
  Widget build(BuildContext context) {
    return  Text(
      'Ownership Economy',
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}