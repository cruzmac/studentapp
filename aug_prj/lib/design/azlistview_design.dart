import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';

class AZItem extends ISuspensionBean {
  final String title;
  final String tag;

  AZItem({required this.title, required this.tag});

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
        .map((item) => AZItem(title: item, tag: item[0].toUpperCase()))
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
      return Column(
        children: [
          Offstage(offstage: offstage, child: buildHeader(tag)),
          ListTile(
            trailing: Container(
              height: 35,
              width: 100,
              decoration: BoxDecoration(color: Colors.cyanAccent),
            ),
            title: Text(item.title),
            // onTap: () =>widget.OnClickedItem(item.title),
          ),
        ],
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
          height: 65,
          width: 65,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: Colors.black45, shape: BoxShape.circle),
          child: Text(
            hint,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
        );
      },
      indexBarMargin: const EdgeInsets.all(7),
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
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black12 ),
      child: Text(
        '$tag',
        softWrap: false,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
