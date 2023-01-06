import 'package:aug_prj/Utils/http_error.dart';
import 'package:aug_prj/design/azlistview_design.dart';
import 'package:aug_prj/models/attendance_model.dart';
import 'package:flutter/material.dart';
import '../design/end_drawer.dart';

class AttendanceMarkingPage extends StatefulWidget {
  const AttendanceMarkingPage({Key? key}) : super(key: key);

  @override
  State<AttendanceMarkingPage> createState() => _AttendanceMarkingPageState();
}

class _AttendanceMarkingPageState extends State<AttendanceMarkingPage> {
  List<Attendance> attendancelist = [];

  @override
  Widget build(BuildContext context) {
    String? name;
    bool color = true;
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
              child: AtozListview(list: attendancelist),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 60,
              color: Colors.white.withOpacity(0.5),
              child: SizedBox(
                height: 55,
                width: 150,
                child: ElevatedButton(
                    onPressed: () {},
                    child:Text('Save'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                        backgroundColor: Colors.black26,
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
