import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> FirebaseInterfaceGetPrecencesLength(
    String documentID, Firestore _db) async {
  var data = await _db
      .collection("aanwezigheden")
      .document('F')
      .collection(documentID)
      .where('aanwezig', isEqualTo: true)
      .getDocuments();

  return data.documents.length;
}
