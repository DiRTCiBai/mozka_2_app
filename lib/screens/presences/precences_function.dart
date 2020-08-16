import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/root/constants.dart';
import 'package:mozka_2_app/screens/start_screen.dart';
import 'package:mozka_2_app/screens/presences/precences_widget.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/modules/precences_database.dart';

class PrecencesFunctions {
  FireBaseInterface fireBaseInterface = FireBaseInterface();

  void SettingModalBottomSheet(context) {
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
                    AddToPrecencesList(context);
                    SaveAanwezigheden(context);
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

  void AddToPrecencesList(BuildContext context) {
    List<SwimmerData> swimlist =
        Provider.of<List<SwimmerData>>(context, listen: false);

    for (var swimmer in swimlist) {
      if (swimmer.aanwezig) {
        PrecencesData precencesData = PrecencesData(id: swimmer.ID);
        Provider.of<PrecencesDatabase>(context, listen: false)
            .AddToList(precencesData);
        swimmer.aanwezig = false;
      }
    }
  }

  void SaveAanwezigheden(BuildContext context) {
    if (Provider.of<PrecencesDatabase>(context, listen: false).GetLength() !=
        0) {
      fireBaseInterface.AddAanwezigheden(
          Provider.of<PrecencesDatabase>(context, listen: false).GetList());
      Provider.of<PrecencesDatabase>(context, listen: false).ClearList();
    }
  }
}
