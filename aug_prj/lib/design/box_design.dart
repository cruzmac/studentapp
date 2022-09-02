import 'package:flutter/material.dart';

class AppTheme {
  static BoxDecoration design = BoxDecoration(
    color: Colors.white,
    border:
        Border.all(color: Colors.white, width: 2.0, style: BorderStyle.solid),
    borderRadius: const BorderRadius.all(Radius.circular(15)),
    boxShadow: const [
      BoxShadow(
        color: Colors.black54,
        offset: Offset(
          0.0,
          0.0,
        ),
        blurRadius: 20.0,
        spreadRadius: 3.0,
      ),
    ],
  );
}
