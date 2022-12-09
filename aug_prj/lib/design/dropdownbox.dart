import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({Key? key}) : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  List<String> list = ['Apple', 'Orange', 'Carrot'];
  String? selecteditem = 'Apple';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint:const Text('Fruits'),
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius:BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      value: selecteditem,
      onChanged: (value) {
        setState(() {
          selecteditem = value.toString();
        });
      },
      items: list.map((item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
    );
  }
}
