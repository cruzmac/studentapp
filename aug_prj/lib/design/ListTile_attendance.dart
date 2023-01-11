import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final int itemNo;
  const ItemTile( 
    this.itemNo,
  );
  @override
  Widget build(BuildContext context) {
    final Color color = Colors.primaries[itemNo % Colors.primaries.length];
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        key: Key('text_$itemNo'),
        tileColor: color.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        onTap: () {},
        title: Text(
          'Student $itemNo',
        ),
        subtitle: const Text('17MSS004'),
      ),
    );
  }
}
