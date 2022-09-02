import 'package:flutter/material.dart';

class FormDesign extends StatelessWidget {
  const FormDesign({Key? key, this.labelText, this.controller})
      : super(key: key);
  final String? labelText;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width:230 ,height: 40),
      child: TextFormField(
        controller: controller,
        style:const  TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.black),
          labelText: labelText,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          fillColor: Colors.black,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
