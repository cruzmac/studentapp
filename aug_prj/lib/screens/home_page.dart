import 'package:aug_prj/Utils/preference.dart';
import 'package:flutter/material.dart';

import '../design/end_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name;
  @override
  void initState() {
    super.initState();
    name = Preference.instance.getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: enddrawer(context, name),
      appBar: AppBar(
        title: const Text('DashBoard'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: ((bounds) =>const LinearGradient(
                  colors: [
                    Colors.blue,
                    Color.fromARGB(255, 86, 186, 213),
                    Color.fromARGB(255, 17, 252, 252),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds)),
            child: const Text(
              ' Hi Every One',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
