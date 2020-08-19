import 'package:flutter/material.dart';
import 'package:mozka_2_app/functions/precences_list/functions/save_precences.dart';
import 'package:mozka_2_app/widgets/warning_bottomsheet/warning_sheet.dart';
import 'package:mozka_2_app/screens/start_screen.dart';

class PrecencesFunctions {
  final BuildContext context;

  PrecencesFunctions({@required this.context});

  void SettingModalBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext bc) {
        return WarningBottomSheet(
          button1text: 'Save',
          button2text: 'Cancel',
          title: 'Wil je opslaan',
          button1: () async {
            await Save();
          },
          button2: () {
            Cancel();
          },
        );
      },
    );
  }

  Future<Function> Save() async {
    SaveAanwezigheden();
    Navigator.popUntil(context, ModalRoute.withName(StartScreen.id));
  }

  Function Cancel() {
    Navigator.pop(context);
  }

  void SaveAanwezigheden() {
    PrecencesListSavePrecences(context);
  }
}
