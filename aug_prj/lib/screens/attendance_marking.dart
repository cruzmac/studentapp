import 'package:aug_prj/design/azlistview_design.dart';
import 'package:flutter/material.dart';
import '../design/listTile_attendance.dart';
import '../design/dropdownbox.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: AtozListview(items: [
                'Ambrose',
                'Machado',
                'Dhanushiya',
                'Divya',
                'Durga',
                'Gautam',
                'Mahalingam',
                'Kavin',
                'Kavin Jai',
                'Uthra',
                'Uvan',
                'Nithiya',
                'Praveen',
                'Raji',
                'Cruz',
                'Alfred',
                'Saranya',
                'Sharmila',
                'Sanjai',
                'Ragesh',
                'Tony',
                'Troy',
                'Petrose'
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
