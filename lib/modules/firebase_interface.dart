import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';

class FireBaseInterface {
  Firestore _db = Firestore.instance;

  void AddSwimmer(SwimmerData swimmerData) {
    DocumentReference documentReference = _db.collection('zwemmers').document();
    documentReference.setData({
      'voornaam': swimmerData.voornaam,
      'achternaam': swimmerData.achernaam,
      'geboortejaar': swimmerData.geboortejaar.toString(),
      'email': swimmerData.email,
      'geslacht': swimmerData.geslacht.toString(),
      'id': documentReference.documentID,
    });
  }

  void DeleteSwimmer(SwimmerData swimmerData) {
    _db.collection('zwemmers').document(swimmerData.ID).delete();
  }

  void EditSwimmer(SwimmerData swimmerData) {
    _db.collection('zwemmers').document(swimmerData.ID).updateData({
      'voornaam': swimmerData.voornaam,
      'achternaam': swimmerData.achernaam,
      'geboortejaar': swimmerData.geboortejaar.toString(),
      'email': swimmerData.email,
      'geslacht': swimmerData.geslacht.toString()
    });
  }
}
