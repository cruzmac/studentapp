import 'package:flutter/material.dart';

import '../design/end_drawer.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: enddrawer(context),
      appBar: AppBar(
        title: const Text('DashBoard'),
        centerTitle: true,
      ),
    );
  }
}
