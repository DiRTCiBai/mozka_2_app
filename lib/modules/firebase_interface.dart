import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';

class FireBaseInterface {
  Firestore _db = Firestore.instance;

  void AddSwimmer(SwimmerData swimmerData) {
    _db
        .collection('zwemmers')
        .document('${swimmerData.voornaam + swimmerData.achernaam}')
        .setData({
      'voornaam': swimmerData.voornaam,
      'achternaam': swimmerData.achernaam,
      'geboortejaar': swimmerData.geboortejaar.toString(),
      'email': swimmerData.email,
      'geslacht': swimmerData.geslacht.toString()
    });
  }

  void DeleteSwimmer(SwimmerData swimmerData) {
    print(swimmerData.voornaam);
    _db
        .collection('zwemmers')
        .document('${swimmerData.voornaam + swimmerData.achernaam}')
        .delete();
  }
}
