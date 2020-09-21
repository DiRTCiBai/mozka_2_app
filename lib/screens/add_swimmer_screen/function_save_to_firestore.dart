import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/constants/firestore_file_constants.dart';

void SaveSwimmerDataToFirestore(SwimmerData2 swimmerData) {
  //maak een instance van de firestore class
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //sla de data van het swimmerdata object op in firestore
  DocumentReference documentReference = _db.collection(kZwemmerFile).doc();
  documentReference.set({
    'voornaam': swimmerData.voornaam,
    'achternaam': swimmerData.achternaam,
    'geboortejaar': swimmerData.geboortejaar.toString(),
    'email': swimmerData.email,
    'geslacht': swimmerData.geslacht.toString(),
    'id': documentReference.id,
    'groep': swimmerData.groep,
  });
}
