import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

Future<int> FirebaseInterfaceGetTotalPrecencesLength(
    String documentID, Firestore _db) async {
  var data = await _db
      .collection("aanwezigheden")
      .document('F')
      .collection(documentID)
      .getDocuments();

  return data.documents.length;
}
