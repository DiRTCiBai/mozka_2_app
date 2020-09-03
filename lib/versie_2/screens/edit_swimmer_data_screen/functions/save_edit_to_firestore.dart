import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/constants/constants.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';

void SaveEditSwimmerDataToFirestore(SwimmerData2 swimmerData) {
  //maak een instance van de firestore class
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //sla de data van het swimmerdata object op in firestore
  print(swimmerData.id);
  DocumentReference documentReference =
      _db.collection(kSaveSwimmerDataId).doc(swimmerData.id);
  documentReference.update({
    'voornaam': swimmerData.voornaam,
    'achternaam': swimmerData.achternaam,
    'geboortejaar': swimmerData.geboortejaar.toString(),
    'email': swimmerData.email,
    'geslacht': swimmerData.geslacht.toString(),
    'groep': swimmerData.groep,
  });
}
