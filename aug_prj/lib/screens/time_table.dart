import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Table'),
        backgroundColor: const Color.fromARGB(255, 219, 162, 229),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 162, 229),
                  border: const Border(
                      bottom: BorderSide(width: 2, color: Colors.purple),
                      left: BorderSide(width: 2, color: Colors.purple),
                      right: BorderSide(width: 2, color: Colors.purple),
                      top: BorderSide(width: 2, color: Colors.purple)),
                  borderRadius: BorderRadius.circular(2)),
              padding: const EdgeInsets.all(20),
              height: 100,
              width: 400,
              child: const Text(
                'Time table',
                style: TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 219, 162, 229),
                  border: const Border(
                      bottom: BorderSide(width: 2, color: Colors.purple),
                      left: BorderSide(width: 2, color: Colors.purple),
                      right: BorderSide(width: 2, color: Colors.purple),
                      top: BorderSide(width: 2, color: Colors.purple)),
                  borderRadius: BorderRadius.circular(2)),
              padding: const EdgeInsets.all(20),
              height: 400,
              width: 400,
              child: const Text(
                'Periods',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
