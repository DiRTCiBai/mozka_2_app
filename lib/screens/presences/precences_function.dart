import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/root/constants.dart';
import 'package:mozka_2_app/screens/start_screen.dart';
import 'package:mozka_2_app/screens/presences/precences_widget.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';

class PrecencesFunctions {
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  List<Aanwezighedendata> precencesList = [];

  void SettingModalBottomSheet(context, List<SwimmerData> swimmerDataList) {
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
                  'wil je opslaan ?',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 15,
                ),
                AanwezighedenButton(
                  displayText: 'Save',
                  onPressed: () {
                    AddAanwezighedenToAanwezighedenList(swimmerDataList);
                    SaveAanwezigheden();
                    Navigator.popUntil(
                        context, ModalRoute.withName(StartScreen.id));
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

  void AddAanwezighedenToAanwezighedenList(List<SwimmerData> swimmerDataList) {
    for (var test in swimmerDataList) {
      if (test.aanwezig) {
        Aanwezighedendata aanwezighedendata =
            Aanwezighedendata(id: test.ID, aanwezig: test.aanwezig);
        precencesList.add(aanwezighedendata);
      }
    }
  }

  void SaveAanwezigheden() {
    if (precencesList.length != 0) {
      fireBaseInterface.AddAanwezigheden(precencesList);
      precencesList.clear();
    }
  }
}
