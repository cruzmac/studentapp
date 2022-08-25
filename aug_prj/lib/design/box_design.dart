import 'package:flutter/material.dart';

class AppTheme {
  static BoxDecoration design = BoxDecoration(
    color: Colors.white,
    border:
        Border.all(color: Colors.purpleAccent, width: 2.0, style: BorderStyle.solid),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    boxShadow: const [
      BoxShadow(
        color: Color.fromARGB(255, 241, 174, 253),
        offset: Offset(
          0.0,
          0.0,
        ),
        blurRadius: 20.0,
        spreadRadius: 2.0,
      ),
      // BoxShadow(
      //   color: Colors.white,
      //   offset: Offset(0.0, 0.0),
      //   blurRadius: 0.0,
      //   spreadRadius: 0.0,
      // ),
    ],
  );
}
