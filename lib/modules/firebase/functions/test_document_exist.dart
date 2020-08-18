import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> FirebaseInterfaceTestIfDocumentExist(
    String documentID, Firestore _db) async {
  var test = await _db.collection('aanwezigheden').document(documentID).get();
  return test.exists;
}
