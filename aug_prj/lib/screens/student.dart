import 'package:aug_prj/design/end_drawer.dart';
import 'package:aug_prj/models/list_model.dart';
import 'package:flutter/material.dart';

class StudentDash extends StatefulWidget {
  const StudentDash({Key? key}) : super(key: key);

  @override
  State<StudentDash> createState() => _StudentDashState();
}

class _StudentDashState extends State<StudentDash> {
  List<ListModel> list = [
    ListModel(
        name: 'Time Table', color: Colors.deepPurpleAccent, type: 'timetable'),
    ListModel(name: 'Events', color: Colors.deepOrangeAccent, type: 'events'),
    ListModel(
        name: 'Create Account', color: Colors.redAccent, type: 'createacct'),
    ListModel(name: 'List', color: Colors.blueAccent, type: 'acctlist'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: enddrawer(context),
      appBar: AppBar(
        title: const Text('Student DashBoard'),
        centerTitle: true,
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 150,
              child: ListTile(
                onTap: () {
                  final type = list[index].type;
                  switch (type) {
                    case 'events':
                      Navigator.of(context).pushNamed('/events');
                      break;
                    case 'timetable':
                      Navigator.of(context).pushNamed('/timetable');
                      break;
                    case 'createacct':
                      Navigator.of(context).pushNamed('/signupgen');
                      break;
                    case 'acctlist':
                      Navigator.of(context).pushNamed('/acctlist');
                      break;
                  }
                },
                textColor: Colors.white,
                tileColor: list[index].color,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                title: Text(
                  list[index].name ?? '',
                  style: const TextStyle(fontSize: 30),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 15.0),
                dense: true,
              ),
            );
          }),
    );
  }
}
