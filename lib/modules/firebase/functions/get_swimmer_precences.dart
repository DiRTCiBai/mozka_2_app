import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Stream FirebaseInterfaceGetSwimmerPrecences(
    BuildContext context, String documentID, Firestore _db) {
  List<String> aanwezighedenList = [];

//  var len = await _db
//      .collection("aanwezigheden")
//      .document('F')
//      .collection(documentID)
//      .getDocuments();
//
//  var citiesRef = _db
//      .collection("aanwezigheden")
//      .document('F')
//      .collection(documentID)
//      .where('aanwezig', isEqualTo: true);

//  var query = await citiesRef.getDocuments();
//  Provider.of<PrecencesDatabase>(context, listen: false).ClearList();
//  print(query.documents.length);
//  for (var x in query.documents) {
//    //print(x.documentID);
//    PrecencesData precencesData = PrecencesData(date: x.documentID);
//    Provider.of<PrecencesDatabase>(context, listen: false)
//        .AddToList(precencesData);
//    aanwezighedenList.add(x.documentID);
//  }
//  print('${len.documents.length}');
////  for (var x in len.documents) {
//    print(x.documentID);
//  }

  return _db
      .collection("aanwezigheden")
      .document('F')
      .collection(documentID)
      .where('aanwezig', isEqualTo: true)
      .snapshots();
}
