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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget buildListItem(AZItem item) {
      return ListTile(
        title: Text(item.title),
        // onTap: () =>widget.OnClickedItem(item.title),
      );
    }

    return AzListView(
      data: items,
      itemCount: items.length,
      itemBuilder: ((context, index) {
        final item = items[index];
        return buildListItem(item);
      }),
    );
  }
}
