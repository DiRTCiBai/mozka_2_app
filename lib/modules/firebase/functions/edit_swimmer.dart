import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';

void FirebaseInterfaceEditSwimmer(SwimmerData swimmerData, Firestore _db) {
  _db.collection('zwemmers').document(swimmerData.ID).updateData({
    'voornaam': swimmerData.voornaam,
    'achternaam': swimmerData.achternaam,
    'geboortejaar': swimmerData.geboortejaar.toString(),
    'email': swimmerData.email,
    'geslacht': swimmerData.geslacht.toString()
  });
}
