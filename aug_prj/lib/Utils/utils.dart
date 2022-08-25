import 'package:flutter/cupertino.dart';

class Utils {
  static cupertinoBox(BuildContext context, String? text) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Warning'),
        content: text != null ? Text(text) : null,
        actions: [
          CupertinoDialogAction(
            onPressed: () =>Navigator.pop(context) ,
            child: const Text(
              'Oki',
            ),
          ),
        ],
      ),
    );
  }
}