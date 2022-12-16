import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

class AZItem extends ISuspensionBean {
  final String title;
  final String tag;
  late bool ispresent;

  AZItem({required this.title, required this.tag,required this.ispresent});

  @override
  String getSuspensionTag() => tag;
}

class AtozListview extends StatefulWidget {
  const AtozListview({Key? key, required this.items}) : super(key: key);
  final List<String> items;

  @override
  State<AtozListview> createState() => _AtozListviewState();
}

class _AtozListviewState extends State<AtozListview> {
  List<AZItem> items = [];
  @override
  void initState() {
    super.initState();
    initList(widget.items);
  }

  void initList(List<String> items) {
    this.items = items
        .map((item) => AZItem(title: item, tag: item[0].toUpperCase(), ispresent: true))
        .toList();

    SuspensionUtil.sortListBySuspensionTag(this.items);
    SuspensionUtil.setShowSuspensionStatus(this.items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget buildListItem(AZItem item) {
      final tag = item.getSuspensionTag();
      final offstage = !item.isShowSuspension;
      return Container(
        padding: const EdgeInsets.only(right: 30, left: 10),
        color: Colors.white,
        child: Column(
          children: [
            Offstage(offstage: offstage, child: buildHeader(tag)),
           const SizedBox(height: 10,),
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 150, 209, 246) ,
                border:Border.all(color: Colors.black45,width: 3),
                borderRadius: BorderRadius.circular(20)
              ),
              child: ListTile(
                trailing: GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      item.ispresent = !item.ispresent;
                    });
                  },
                  child:Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45,width: 2,),
                      borderRadius: BorderRadius.circular(30),
                      color: item.ispresent ? Colors.green : Colors.red,
                      shape: BoxShape.rectangle,
                    ),
                    child:Text(item.ispresent ?'Present':'Absent',
                    style:const TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ),
                title: Text(item.title,),
                // onTap: () =>widget.OnClickedItem(item.title),
              ),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      );
    }

    return AzListView(
      data: items,
      itemCount: items.length,
      itemBuilder: ((context, index) {
        final item = items[index];
        return buildListItem(item);
      }),
      indexHintBuilder: (context, hint) {
        return Container(
          height: 75,
          width: 75,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.black87, shape: BoxShape.circle),
          child: Text(
            hint,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        );
      },
      indexBarMargin: const EdgeInsets.all(2),
      indexBarItemHeight:23,
      indexBarOptions: const IndexBarOptions(
        needRebuild: true,
        selectTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        selectItemDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black45,
        ),
        indexHintAlignment: Alignment.centerRight,
        indexHintOffset: Offset(-20, 0),
      ),
    );
  }

  Widget buildHeader(String tag) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 40,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black12),
      child: Text(
        '$tag',
        softWrap: false,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
