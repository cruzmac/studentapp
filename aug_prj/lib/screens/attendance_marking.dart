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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(
                  height: 75,
                  width: 120,
                  child: Dropdown(),
                ),
                SizedBox(
                  height: 75,
                  width: 120,
                  child: Dropdown(),
                ),
                SizedBox(
                  height: 75,
                  width: 120,
                  child: Dropdown(),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
              width: 400,
              child: Dropdown(),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.black12,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(20)),
                    child: AtozListview(items: [
                      'Ambrose',
                      'Machado',
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
                // child: GridView.builder(
                //   shrinkWrap: true,
                //   itemCount: 100,
                //   itemBuilder: (context, index) => ItemTile(index),
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     childAspectRatio: 2,
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
