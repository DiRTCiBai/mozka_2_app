import 'package:flutter/material.dart';
import 'package:mozka_2_app/root/constants.dart';
import 'package:mozka_2_app/widgets/lists/precences_button.dart';

class WarningBottomSheet extends StatelessWidget {
  final Function button1;
  final Function button2;
  final String title;
  final String button1text;
  final String button2text;

  WarningBottomSheet(
      {@required this.button1,
      @required this.button2,
      @required this.title,
      @required this.button1text,
      @required this.button2text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: kbottomsheetBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title, //'wil je opslaan ?',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 15,
          ),
          AanwezighedenButton(
            displayText: button1text, //'Save',
            onPressed: button1,
          ),
          AanwezighedenButton(
            displayText: button2text, //'Cancel',
            onPressed: button2,
          ),
        ],
      ),
    );
  }
}
