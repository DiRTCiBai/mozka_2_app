import 'package:mozka_2_app/versie_2/constants/constants.dart';
import 'package:mozka_2_app/versie_2/modules/trainingen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrainingenDatabase {
  Stream<List<Trainingen>> get trainingenDatabase {
    FirebaseFirestore _db = FirebaseFirestore.instance;

    return _db
        .collection('trainingen')
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.docs
            .map((DocumentSnapshot documentSnapshot) => Trainingen(
                  data: documentSnapshot.data()['training'],
                  aanmaakDatum: documentSnapshot.data()['aanmaakDatum'],
                  opmerking: documentSnapshot.data()['opmerking'],
                  datum: documentSnapshot.data()['datum'],
                  duur: documentSnapshot.data()['duur'],
                  trainer: documentSnapshot.data()['trainer'],
                  type: documentSnapshot.data()['type'],
                  sterren: documentSnapshot.data()['sterren'],
                ))
            .toList());
  }
}
