import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 180, 101, 194),
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color:Color.fromARGB(255, 206, 141, 217),
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
                "Home",style: TextStyle(color: Colors.white),
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
              title: const Text("Students",style: TextStyle(color: Colors.white),),
              leading: const Icon(Icons.person,size: 35,color: Colors.purple,),
              onTap: () {
                Navigator.of(context).pushNamed('/student');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('DashBoard'),
        backgroundColor: const Color.fromARGB(255, 219, 162, 229),
        centerTitle: true,
      ),
    );
  }
}
