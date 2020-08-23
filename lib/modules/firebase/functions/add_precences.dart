import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:provider/provider.dart';

void FirebaseInterfaceAddPrecences(
    BuildContext context, Firestore _db, String DocumentID) async {
  List<SwimmerData> swimlist =
      Provider.of<List<SwimmerData>>(context, listen: false);
  for (var len in swimlist) {
    _db
        .collection('2020')
        .document(len.ID)
        .collection('1')
        .document('1') //DocumentID
        .setData({'aanwezig': len.aanwezig, 'groep': len.groep});
  }
}
