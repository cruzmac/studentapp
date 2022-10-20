import 'package:flutter/material.dart';
 
class AppTheme {
  static BoxDecoration design = BoxDecoration(
    gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 235, 119, 253),
              Color.fromARGB(255, 237, 162, 253),
              Color.fromARGB(255, 250, 195, 248),
            ],begin: Alignment.topLeft,end: Alignment.bottomRight),
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
