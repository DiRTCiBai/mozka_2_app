import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';

class SwimmerDataBase {
  final Firestore _firestore = Firestore.instance;

  Stream<List<SwimmerData>> get swimerlist {
    return _firestore
        .collection('zwemmers')
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.documents
            .map((DocumentSnapshot documentSnapshot) => SwimmerData(
                  voornaam: documentSnapshot.data['voornaam'],
                  achternaam: documentSnapshot.data['achternaam'],
                  geboortejaar:
                      int.parse(documentSnapshot.data['geboortejaar']),
                  email: documentSnapshot.data['email'],
                  geslacht: documentSnapshot.data['geslacht'],
                  ID: documentSnapshot.documentID,
                ))
            .toList());
  }

  Stream<List<PrecencesData>> get precenceslist {
    return _firestore
        .collection('aanwezigheden')
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.documents
            .map((DocumentSnapshot documentSnapshot) => PrecencesData(
                  id: documentSnapshot.data['id'],
                ))
            .toList());
  }
}
