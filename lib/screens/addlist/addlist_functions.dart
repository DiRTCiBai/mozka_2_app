import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/root/constants.dart';
import 'package:mozka_2_app/screens/presences/precences_widget.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';

class AddListFunctions {
  FireBaseInterface fireBaseInterface = FireBaseInterface();

  void SettingModalBottomSheet(context, SwimmerData swimmerData) {
    showModalBottomSheet(
        backgroundColor: Color(0xFF757575),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 200,
            decoration: kbottomsheetBoxDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'wil je verwijderen ?',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 15,
                ),
                AanwezighedenButton(
                  displayText: 'Verwijderen',
                  onPressed: () {
                    fireBaseInterface.DeleteSwimmer(swimmerData);
                    Navigator.pop(context);
                  },
                ),
                AanwezighedenButton(
                    displayText: 'Cancel',
                    onPressed: () => Navigator.pop(context)),
              ],
            ),
          );
        });
  }
}
