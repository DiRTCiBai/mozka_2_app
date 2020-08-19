import 'package:cloud_firestore/cloud_firestore.dart';

Future<dynamic> FirebaseInterfaceGetSwimmerPrecences(
    String documentID, Firestore _db) async {
  List<String> aanwezighedenList = [];

  var len = await _db
      .collection("aanwezigheden")
      .document('F')
      .collection(documentID)
      .getDocuments();

  var citiesRef = _db
      .collection("aanwezigheden")
      .document('F')
      .collection(documentID)
      .where('aanwezig', isEqualTo: true);

  var query = await citiesRef.getDocuments();

//  print(query.documents.length);
  for (var x in query.documents) {
    print(x.documentID);
    aanwezighedenList.add(x.documentID);
  }
  print('\n\n\n ${len.documents.length}');
//  for (var x in len.documents) {
//    print(x.documentID);
//  }
  return aanwezighedenList;
}
