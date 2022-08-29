import 'package:aug_prj/design/form_design.dart';
import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  Row row({String? name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name ?? '',
          style: const TextStyle(fontSize: 20),
        ),
        const FormDesign(
          labelText: 'Day order',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Table'),
        backgroundColor: const Color.fromARGB(255, 219, 162, 229),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
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
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 195, 240),
                      border: const Border(
                          bottom: BorderSide(width: 2, color: Colors.purple),
                          left: BorderSide(width: 2, color: Colors.purple),
                          right: BorderSide(width: 2, color: Colors.purple),
                          top: BorderSide(width: 2, color: Colors.purple)),
                      borderRadius: BorderRadius.circular(2)),
                  height: 400,
                  width: 400,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const Text(
                        'Periods',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      row(name: 'Monday'),
                      const SizedBox(
                        height: 10,
                      ),
                      row(name: 'Tuesday'),
                      const SizedBox(
                        height: 10,
                      ),
                      row(name: 'Wednesday'),
                      const SizedBox(
                        height: 10,
                      ),
                      row(name: 'Thurday'),
                      const SizedBox(
                        height: 10,
                      ),
                      row(name: 'Friday'),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Save'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 210, 82, 232),
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400))),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
