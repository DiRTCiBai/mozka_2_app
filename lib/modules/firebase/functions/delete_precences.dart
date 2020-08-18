import 'package:cloud_firestore/cloud_firestore.dart';

void FirebaseInterfaceDeletePrecences(String documentID, Firestore _db) {
  _db.collection('aanwezigheden').document(documentID).delete();
}
