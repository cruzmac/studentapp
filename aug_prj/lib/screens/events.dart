import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  const Events({Key? key}) : super(key: key);

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> with SingleTickerProviderStateMixin {
  late final TabController tabcontroller;
  @override
  void initState() {
    tabcontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: Colors.white, width: 2.0, style: BorderStyle.solid),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ]),
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                controller: tabcontroller,
                tabs: const [
                  Tab(
                    child: Text(
                      'Up Coming',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Finished',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(controller: tabcontroller, children: [
                  Container(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    '23',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'JAN',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    '2022',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    '23',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    'JAN',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    '2022',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
