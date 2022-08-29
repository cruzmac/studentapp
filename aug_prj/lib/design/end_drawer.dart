import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Drawer enddrawer(BuildContext context) {
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 206, 141, 217),
    child: ListView(
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 180, 101, 194),
          ),
          child: Text(
            'Student App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
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
            Navigator.pop(context);
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
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/student');
          },
        ),
        ListTile(
          title: const Text(
            "Log Out",
            style: TextStyle(color: Colors.white),
          ),
          leading: const Icon(
            Icons.logout,
            size: 35,
            color: Colors.purple,
          ),
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pop(context);
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
        ),
      ],
    ),
  );
}
