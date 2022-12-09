import 'package:flutter/material.dart';
import '../design/ListTile_attendance.dart';
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
            Container(
              height: 500,
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(20)),
              child: GridView.builder(
                itemCount: 100,
                itemBuilder: (context, index) => ItemTile(index),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
