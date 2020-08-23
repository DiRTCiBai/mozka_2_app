import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';

void SaveSwimmerDataToFirestore(SwimmerData swimmerData) {
  Firestore _db = Firestore.instance;

  DocumentReference documentReference = _db.collection('zwemmers').document();
  documentReference.setData({
    'voornaam': swimmerData.voornaam,
    'achternaam': swimmerData.achternaam,
    'geboortejaar': swimmerData.geboortejaar.toString(),
    'email': swimmerData.email,
    'geslacht': swimmerData.geslacht.toString(),
    'id': documentReference.documentID,
    'groep': swimmerData.groep,
  });
}
