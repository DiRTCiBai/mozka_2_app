import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/constants/firestore_file_constants.dart';

Stream<List<SwimmerData2>> GetSwimmerData() {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  return _db
      .collection(kZwemmerFile)
      .snapshots()
      .map((QuerySnapshot querySnapshot) => querySnapshot.docs
          .map((DocumentSnapshot documentSnapshot) => SwimmerData2(
                voornaam: documentSnapshot.data()['voornaam'],
                achternaam: documentSnapshot.data()['achternaam'],
                geboortejaar: documentSnapshot.data()['geboortejaar'],
                email: documentSnapshot.data()['email'],
                geslacht: documentSnapshot.data()['geslacht'],
                id: documentSnapshot.id,
                groep: documentSnapshot.data()['groep'],
              ))
          .toList());
}
