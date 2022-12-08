import 'package:flutter/material.dart';

import '../design/end_drawer.dart';

class AttendanceMarkingPage extends StatefulWidget {
  const AttendanceMarkingPage({Key? key}) : super(key: key);

  @override
  State<AttendanceMarkingPage> createState() => _AttendanceMarkingPageState();
}

class _AttendanceMarkingPageState extends State<AttendanceMarkingPage> {
  @override
  Widget build(BuildContext context) {
    String? name;
    return Scaffold(
      endDrawer: EndDrawer().enddrawer(context, name),
      appBar: AppBar(
        title: const Text('Attendance Marking'),
        centerTitle: true,
      ),
      body: Container(
        height: 200,
        width: 400,
        child: Row(
          children: [
            Dropdown(),
          ],
        ),
      ),
    );
  }
}

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
    return Container(
      margin: const EdgeInsets.only(top:50),
      alignment: Alignment.topCenter,
      child: DropdownButton(
        value: selecteditem,
        onChanged: (value) {
          setState(() {
            selecteditem = value.toString();
          });
        },
        items: list.map((item) {
          return DropdownMenuItem(value: item, child: Text(item));
        }).toList(),
      ),
    );
  }
}
