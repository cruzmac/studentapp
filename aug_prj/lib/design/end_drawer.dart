import 'package:aug_prj/repository/googlesignin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Drawer enddrawer(BuildContext context, String? name) {
  return Drawer(
    backgroundColor: Colors.black38,
    child: ListView(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.blue,
              Color.fromARGB(255, 214, 55, 254),
              Color.fromARGB(255, 244, 253, 66),
            ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          ),
          child: Column(
            children: [
              const SelectableText(
                'Student App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const CircleAvatar(
                    child: Text(''),
                    radius: 25,
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SelectableText(
                    name ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
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
            color: Colors.white,
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
            color: Colors.white,
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
            color: Colors.white,
          ),
          onTap: () async {
            Authentication().signOut();
            Navigator.pop(context);
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
        ),
      ],
    ),
  );
}
