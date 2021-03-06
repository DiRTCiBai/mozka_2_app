import 'package:cloud_firestore/cloud_firestore.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/modules/derest/aanwezigheden_data.dart';

class SwimmerDataBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<SwimmerData>> get swimerlist {
    return _firestore
        .collection('zwemmers')
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((DocumentSnapshot documentSnapshot) => SwimmerData(
                  voornaam: documentSnapshot.data()['voornaam'],
                  achternaam: documentSnapshot.data()['achternaam'],
                  geboortejaar:
                      int.parse(documentSnapshot.data()['geboortejaar']),
                  email: documentSnapshot.data()['email'],
                  geslacht: documentSnapshot.data()['geslacht'],
                  ID: documentSnapshot.id,
                ))
            .toList());
  }

  Stream<List<PrecencesData>> get precenceslist {
    return _firestore
        .collection('aanwezigheden')
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((DocumentSnapshot documentSnapshot) => PrecencesData(
                  date: documentSnapshot.data()['id'],
                ))
            .toList());
  }
}
