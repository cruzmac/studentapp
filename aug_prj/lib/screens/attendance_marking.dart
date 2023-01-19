import 'package:aug_prj/Utils/http_error.dart';
import 'package:aug_prj/models/attendance_model.dart';
import 'package:aug_prj/repository/attendance_repository.dart';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import '../design/end_drawer.dart';
import 'package:intl/intl.dart';

class AttendanceMarkingPage extends StatefulWidget {
  AttendanceMarkingPage({Key? key}) : super(key: key);
  @override
  State<AttendanceMarkingPage> createState() => _AttendanceMarkingPageState();
}

class _AttendanceMarkingPageState extends State<AttendanceMarkingPage> {
  List<Attendance> attendancelist = [];
  List<Attendance> updatedlist = [];
  late Attendance attendance;
  var finalDate;
  var finalTime;

  @override
  void initState() {
    super.initState();
    fetchpost();
    initList(attendancelist);
  }

  getCurrentDate() {
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    var formattedTime = "${dateParse.hour}:${dateParse.second}";
    setState(() {
      finalTime = formattedTime.toString();
      finalDate = formattedDate.toString();
    });
  }

  Future<void> fetchpost() async {
    try {
      final attend = await AttendanceRepository().fetchposts();
      setState(() {
        attendancelist = attend;
      });
    } on HttpError catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  Future<void> updateAttendance(Attendance attend) async {
    getCurrentDate();
    final post = attend;
    final id = attend.stud_id;

    if (id == null) return;
    final updatedPost = Attendance(
      stud_id: id,
      name: post.name,
      attendance: post.attendance,
      date: finalDate,
      time: finalTime,
    );
    updatedlist.add(updatedPost);
    print(updatedlist);
  }

  Future<void> updatelist() async {
    for (Attendance post in updatedlist) {
      try {
        final result =
            await AttendanceRepository.updateList(post.stud_id, post);
      } on HttpError catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );
      }
    }
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
  }

  void initList(List<Attendance> list) {
    attendancelist = list
        .map((item) => Attendance(
            stud_id: item.stud_id,
            name: item.name,
            attendance: item.attendance,
            tag: item.name![0].toUpperCase()))
        .toList();
    setState(() {});
  }

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
              child: AzListView(
                data: attendancelist,
                itemCount: attendancelist.length,
                itemBuilder: ((context, index) {
                  final item = attendancelist[index];
                  return buildListItem(item, index);
                }),
                indexHintBuilder: (context, hint) {
                  return Container(
                    height: 75,
                    width: 75,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        color: Colors.black87, shape: BoxShape.circle),
                    child: Text(
                      hint,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  );
                },
                indexBarMargin: const EdgeInsets.all(2),
                indexBarItemHeight: 18,
                indexBarOptions: const IndexBarOptions(
                  needRebuild: true,
                  selectTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  selectItemDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black45,
                  ),
                  indexHintAlignment: Alignment.centerRight,
                  indexHintOffset: Offset(-20, 0),
                ),
              ),
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

  Widget buildListItem(Attendance list, int index) {
    final tag = list.getSuspensionTag();
    final offstage = !list.isShowSuspension;
    final attend = list;
    return Container(
      padding: const EdgeInsets.only(right: 40, left: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Offstage(offstage: offstage, child: buildHeader(tag)),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 150, 209, 246),
                border: Border.all(color: Colors.black45, width: 3),
                borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              trailing: InkWell(
                splashColor: Colors.white.withOpacity(0.5),
                onDoubleTap: () {
                  setState(() {
                    list.attendance = !list.attendance;
                  });
                  updateAttendance(attend);
                },
                child: Ink(
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black45,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: list.attendance ? Colors.green : Colors.red,
                      shape: BoxShape.rectangle,
                    ),
                    child: Text(
                      list.attendance ? 'Present' : 'Absent',
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              title: Text(
                '${list.name}',
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text('${list.stud_id}'),
              // onTap: () =>widget.OnClickedItem(item.title),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget buildHeader(String tag) {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black12),
      child: Text(
        '$tag',
        softWrap: false,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
