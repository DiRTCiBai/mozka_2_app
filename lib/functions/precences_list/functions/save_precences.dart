import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/modules/precences_database.dart';
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';

FireBaseInterface fireBaseInterface = FireBaseInterface();

void PrecencesListSavePrecences(BuildContext context) async {
  var notNull =
      Provider.of<PrecencesDatabase>(context, listen: false).GetLength();
  var precencesList =
      Provider.of<PrecencesDatabase>(context, listen: false).GetList();

  if (notNull != 0) {
    if (await TestIfDocumentExist()) {
      fireBaseInterface.DeletePrecences(_GetDate());
    }
    fireBaseInterface.AddPrecences(precencesList, _GetDate());
    Provider.of<PrecencesDatabase>(context, listen: false).ClearList();
  }
}

Future<bool> TestIfDocumentExist() async {
  var exist = await fireBaseInterface.TestIfDocumentExist(_GetDate());
  if (await exist) {
    return true;
  } else
    return false;
}

String _GetDate() {
  var now = new DateTime.now();
  String date = now.day.toString() + now.month.toString() + now.year.toString();
  return date;
}
