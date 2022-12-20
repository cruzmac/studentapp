import 'package:aug_prj/Utils/http_error.dart';
import 'package:aug_prj/models/attendance_model.dart';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

import '../repository/attendance_repository.dart';

// class AZItem extends ISuspensionBean {
//   final String title;
//   final String tag;
//   late bool ispresent;

//   AZItem({required this.title, required this.tag, required this.ispresent});

//   @override
//   String getSuspensionTag() => tag;
// }

class AtozListview extends StatefulWidget {
  const AtozListview({Key? key, required this.list}) : super(key: key);
  final List<Attendance> list;

  @override
  State<AtozListview> createState() => _AtozListviewState();
}

class _AtozListviewState extends State<AtozListview> {
  List<Attendance> attendancelist = widget.list;
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

  // void initList(List<String> items) {
  //   this.items = items
  //       .map((item) =>
  //           AZItem(title: item, tag: item[0].toUpperCase(), ispresent: true))
  //       .toList();

  //   SuspensionUtil.sortListBySuspensionTag(this.items);
  //   SuspensionUtil.setShowSuspensionStatus(this.items);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    Widget buildListItem(Attendance attendancelist) {
      final tag = attendancelist.getSuspensionTag();
      final offstage = !attendancelist.isShowSuspension;
       bool ispresent = attendancelist.attendance ?? true;
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
                      ispresent = !ispresent;
                    });
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
                        color: ispresent
                            ? Colors.green
                            : Colors.red,
                        shape: BoxShape.rectangle,
                      ),
                      child: Text(
                        ispresent ? 'Present' : 'Absent',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  '${attendancelist.name}',
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text('${attendancelist.stud_id}'),
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

    return AzListView(
      data: attendancelist,
      itemCount: attendancelist.length,
      itemBuilder: ((context, index) {
        final item = attendancelist[index];
        return buildListItem(item);
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
      indexBarItemHeight: 23,
      indexBarOptions: const IndexBarOptions(
        needRebuild: true,
        selectTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        selectItemDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black45,
        ),
        indexHintAlignment: Alignment.centerRight,
        indexHintOffset: Offset(-20, 0),
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
