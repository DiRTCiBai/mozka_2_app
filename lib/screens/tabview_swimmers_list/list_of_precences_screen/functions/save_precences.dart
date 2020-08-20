import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/modules/derest/precences_database.dart';
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';

FireBaseInterface fireBaseInterface = FireBaseInterface();

void PrecencesListSavePrecences(BuildContext context) async {
  if (await TestIfDocumentExist()) {
    fireBaseInterface.DeletePrecences(_GetDate());
  }
  fireBaseInterface.AddPrecences(context, _GetDate());
  Provider.of<PrecencesDatabase>(context, listen: false).ClearList();
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
