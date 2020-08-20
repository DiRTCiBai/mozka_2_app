import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';
import 'package:mozka_2_app/widgets/warning_bottomsheet/warning_sheet.dart';

class AddListFunctions {
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  final BuildContext context;

  AddListFunctions({@required this.context});

  void SettingModalBottomSheet(SwimmerData swimmerData) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent, //Color(0xFF757575),
      context: context,
      builder: (BuildContext bc) {
        return WarningBottomSheet(
          button1text: 'Verwijder',
          button2text: 'Cancel',
          title: 'Wil je verwijderen',
          button1: () {
            fireBaseInterface.DeleteSwimmer(swimmerData);
            Navigator.pop(context);
          },
          button2: () {
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
