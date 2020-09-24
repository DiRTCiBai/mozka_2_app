import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/home_screen/constants.dart';
import 'function_get_groepinfo_string.dart';
import 'package:clipboard_manager/clipboard_manager.dart';

class MainGroepInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.info,
        color: Colors.blueGrey,
        size: iconSize,
      ),
      title: Text(
        'Groep info',
        style: TextStyle(fontSize: 17),
      ),
      onTap: () async {
        Navigator.pop(context);
        ClipboardManager.copyToClipBoard(await GetGoepInfo()).then((result) {
          final snackBar = SnackBar(
            content: Text('Groep info gekopieerd naar Clipboard'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {},
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        });
      },
    );
  }
}
