import 'package:mozka_2_app/versie_2/constants/constants.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<SwimmerData2>> GetSwimmerData() {
  Firestore _db = Firestore.instance;

  return _db
      .collection(kSaveSwimmerDataId)
      .snapshots()
      .map((QuerySnapshot querySnapshot) => querySnapshot.documents
          .map((DocumentSnapshot documentSnapshot) => SwimmerData2(
                voornaam: documentSnapshot.data['voornaam'],
                achternaam: documentSnapshot.data['achternaam'],
                geboortejaar: documentSnapshot.data['geboortejaar'],
                email: documentSnapshot.data['email'],
                geslacht: documentSnapshot.data['geslacht'],
                id: documentSnapshot.documentID,
              ))
          .toList());
}
