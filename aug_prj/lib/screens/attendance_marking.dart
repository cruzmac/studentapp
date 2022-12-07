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
        height: 100,
        width: 400,
        color: Colors.grey,
        child: Row(
          children: [
            DropDownButton(),
          ],
        ),
      ),
    );
  }
}

class DropDownButton extends StatefulWidget {
  const DropDownButton({Key? key}) : super(key: key);

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    return DropdownButton(
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
    );
  }
}
