import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/modules/oefeningen_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
import 'package:mozka_2_app/versie_2/modules/time.dart';

String ConvertListToData(BuildContext context) {
  var list = Provider.of<OefeningenDatabase>(context, listen: false).GetLijst();
  if (list.length != 1) {
    list.remove(list.last);
  }

  int totAfstand = 0;

  List<String> training = [];

  for (var oef in list) {
    training.add(oef.afstand.toString());
    training.add(oef.oefening);

    totAfstand += oef.afstand;

    print(oef.afstand);
    print(oef.oefening);
  }

  training.add(totAfstand.toString());
  training.add('totale afstand');

  var data = jsonEncode(training);

  return data;
}

void SaveTraining(String data, String loggedInUser, String datum,
    String typeTraining, String slag) {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  if (datum != null && data != null) {
    _db.collection('trainingen2').doc(datum).set({
      'training': data,
      'aanmaakDatum': Time().GetTimeStamp(),
      'sterren': 0,
      'opmerking': '',
      'datum': datum,
      'type': typeTraining,
      'trainer': loggedInUser,
      'slag': slag,
    });
  }
}
