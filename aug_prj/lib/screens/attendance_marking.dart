import 'package:aug_prj/Utils/http_error.dart';
import 'package:aug_prj/design/azlistview_design.dart';
import 'package:aug_prj/models/attendance_model.dart';
import 'package:aug_prj/repository/attendance_repository.dart';
import 'package:flutter/material.dart';
import '../design/end_drawer.dart';

class AttendanceMarkingPage extends StatefulWidget {
  const AttendanceMarkingPage({Key? key}) : super(key: key);

  @override
  State<AttendanceMarkingPage> createState() => _AttendanceMarkingPageState();
}

class _AttendanceMarkingPageState extends State<AttendanceMarkingPage> {
  List<Attendance> attendancelist = [];
  // @override
  // void initState() {
  //   super.initState();
  //   fetchpost();
  // }

  // Future<void> fetchpost() async {
  //   try {
  //     final attend = await AttendanceRepository().fetchposts();
  //     setState(() {
  //       attendancelist = attend;
  //     });
  //   } on HttpError catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(e.message)));
  //   }
  // }

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
              child: AtozListview(list: attendancelist),
            ),
          ],
        ),
      ),
    );
  }
}
