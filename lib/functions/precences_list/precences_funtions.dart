import 'package:flutter/material.dart';
import 'functions/add_to_precenceslist.dart';
import 'package:mozka_2_app/functions/precences_list/functions/save_precences.dart';
import 'package:mozka_2_app/widgets/warning_bottomsheet/warning_sheet.dart';
import 'package:mozka_2_app/screens/start_screen.dart';

class PrecencesFunctions {
  final BuildContext context;

  PrecencesFunctions({this.context});

  void SettingModalBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Color(0xFF757575),
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
    AddToPrecencesList();
    SaveAanwezigheden();
    Navigator.popUntil(context, ModalRoute.withName(StartScreen.id));
  }

  Function Cancel() {
    Navigator.pop(context);
  }

  void AddToPrecencesList() {
    PrecencesListAddToPrecencesList(context);
  }

  void SaveAanwezigheden() {
    PrecencesListSavePrecences(context);
  }
}
