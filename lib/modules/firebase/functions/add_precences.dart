import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';

void FirebaseInterfaceAddPrecences(List<PrecencesData> aawezighedenList,
    Firestore _db, String DocumentID) async {
  DocumentReference documentReference =
      _db.collection('aanwezigheden').document(DocumentID);
  documentReference.setData(MapData(aawezighedenList));
}

Map<String, dynamic> MapData(List<PrecencesData> aawezighedenList) {
  Map<String, dynamic> test = Map();
  for (int i = 0; i < aawezighedenList.length; i++) {
    test.putIfAbsent('$i', () => aawezighedenList[i].id);
  }
  return test;
}
