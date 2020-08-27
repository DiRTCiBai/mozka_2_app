import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';

Future<dynamic> FirebaseInterfaceGetSwimmerData(FirebaseFirestore _db) async {
  List<SwimmerData> swimmerList;
  var database = await _db.collection('zwemmers').get();
  for (var data in database.docs) {
    SwimmerData swimmerData = SwimmerData(
      voornaam: data.data()['voornaam'],
      achternaam: data.data()['achernaam'],
      geboortejaar: data.data()['geboortejaar'],
      email: data.data()['email'],
      geslacht: data.data()['geslacht'],
    );
    swimmerList.add(swimmerData);
  }
  return swimmerList;
}
