import 'package:flutter/material.dart';

Future<void> CheckSaveData(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('test'),
          content: SingleChildScrollView(
            child: ListBody(children: [
              Text('Vologende velden moeten worden ingevuld:\n'),
              Text('Voornaam, achternaam en geboortejaar'),
            ]),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('oke'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

Future<dynamic> DeleteSwimmerCheck(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('test'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('test'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('delete'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            FlatButton(
              child: Text('cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      });
}
