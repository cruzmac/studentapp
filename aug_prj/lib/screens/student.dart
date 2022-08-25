import 'package:flutter/material.dart';

class StudentDash extends StatefulWidget {
  const StudentDash({Key? key}) : super(key: key);

  @override
  State<StudentDash> createState() => _StudentDashState();
}

class _StudentDashState extends State<StudentDash> {
  List<Map> list = [
    {'name': 'Sign Up', 'color': 'red'},
    {'name': 'Profile', 'color': 'deepPurpleAccent'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 180, 101, 194),
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 206, 141, 217),
              ),
              child: Text(
                'Student App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.home,
                size: 35,
                color: Colors.purple,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
            ListTile(
              title: const Text(
                "Students",
                style: TextStyle(color: Colors.white),
              ),
              leading: const Icon(
                Icons.person,
                size: 35,
                color: Colors.purple,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/student');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Student DashBoard'),
        backgroundColor: const Color.fromARGB(255, 219, 162, 229),
        centerTitle: true,
      ),
      body: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          itemCount: 2,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 150,
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('/signupgen');
                },
                textColor: Colors.white,
                tileColor:Colors.deepPurpleAccent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                title: Text(
                  list[index]['name'],
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
