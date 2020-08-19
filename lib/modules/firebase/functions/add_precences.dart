import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:provider/provider.dart';

void FirebaseInterfaceAddPrecences(
    BuildContext context, Firestore _db, String DocumentID) async {
  List<SwimmerData> swimlist =
      Provider.of<List<SwimmerData>>(context, listen: false);
//  DocumentReference documentReference =
//      _db.collection('aanwezigheden').document(DocumentID);
//  documentReference.setData(MapData(aawezighedenList));
  for (var len in swimlist) {
    _db
        .collection('aanwezigheden')
        .document('F')
        .collection(len.ID)
        .document('2582020') //DocumentID
        .setData({'aanwezig': len.aanwezig});
  }
//  _db
//      .collection('aanwezigheden')
//      .document('F')
//      .collection("trainingen")
//      .document(DocumentID)
//      .setData({DocumentID: DocumentID});
}

//Map<String, dynamic> MapData(List<PrecencesData> aawezighedenList) {
//  Map<String, dynamic> test = Map();
//  for (int i = 0; i < aawezighedenList.length; i++) {
//    test.putIfAbsent('$i', () => aawezighedenList[i].id);
//  }
//  return test;
//}
