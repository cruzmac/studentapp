import 'package:aug_prj/Utils/http_error.dart';
import 'package:aug_prj/design/azlistview_design.dart';
import 'package:aug_prj/design/updatelist.dart';
import 'package:aug_prj/models/attendance_model.dart';
import 'package:aug_prj/repository/attendance_repository.dart';
import 'package:flutter/material.dart';
import '../design/end_drawer.dart';

class AttendanceMarkingPage extends StatefulWidget {
  AttendanceMarkingPage({Key? key}) : super(key: key);
  @override
  State<AttendanceMarkingPage> createState() => _AttendanceMarkingPageState();
}

class _AttendanceMarkingPageState extends State<AttendanceMarkingPage> {
  List<Attendance> uplist = UpdatedList().list;
  @override
  Widget build(BuildContext context) {
    String? name;
    // bool color = true;
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
            const Expanded(
              child: AtozListview(),
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
                    onPressed: () {
                      updatelist();
                    },
                    child: Text('Save'),
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

  Future<void> updatelist() async {
    final updatedlist = uplist;
    for (Attendance post in updatedlist) {
      try {
        final result =
            await AttendanceRepository.updateList(post.stud_id, post);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            elevation: 0,
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            content: Row(
              children: const [
                Icon(
                  Icons.check_circle,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  'Attendance Updated Successfully',
                ),
              ],
            ),
          ),
        );
      } on HttpError catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );
      }
    }
  }
}
