import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'aanwezigheden_data.dart';

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

  Future<dynamic> GetSwimmerData() async {
    List<SwimmerData> swimmerList;
    var printtext = await _db.collection('zwemmers').getDocuments();
    for (var data in printtext.documents) {
      SwimmerData swimmerData = SwimmerData(
        voornaam: data.data['voornaam'],
        achernaam: data.data['achernaam'],
        geboortejaar: data.data['geboortejaar'],
        email: data.data['email'],
        geslacht: data.data['geslacht'],
      );
      swimmerList.add(swimmerData);
    }
    return swimmerList;
  }

  Future<dynamic> GetSwimmerDataLength() async {
    List<SwimmerData> swimmerList;
    var printtext = await _db.collection('zwemmers').getDocuments();
    return printtext.documents.length;
  }

  void AddAanwezigheden(List<Aanwezighedendata> aawezighedenList) {
    var map = Aanwezighedenlijst(aawezighedenList);

    DocumentReference documentReference =
        _db.collection('aanwezigheden').document();
    documentReference.setData(map);
  }

  Map<String, dynamic> Aanwezighedenlijst(
      List<Aanwezighedendata> aawezighedenList) {
    Map<String, dynamic> test = Map();
    for (int i = 0; i < aawezighedenList.length; i++) {
      test.putIfAbsent('$i', () => aawezighedenList[i].id);
    }
    return test;
  }
}
