import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';

void FirebaseInterfaceAddSwimmer(SwimmerData swimmerData, Firestore _db) {
  DocumentReference documentReference = _db.collection('zwemmers').document();
  documentReference.setData({
    'voornaam': swimmerData.voornaam,
    'achternaam': swimmerData.achternaam,
    'geboortejaar': swimmerData.geboortejaar.toString(),
    'email': swimmerData.email,
    'geslacht': swimmerData.geslacht.toString(),
    'id': documentReference.documentID,
  });
}
