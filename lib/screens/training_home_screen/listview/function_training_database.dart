import 'package:mozka_2_app/modules/trainingen.dart';
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
                  slag: documentSnapshot.data()['slag'],
                  trainer: documentSnapshot.data()['trainer'],
                  type: documentSnapshot.data()['type'],
                  sterren: documentSnapshot.data()['sterren'],
                  groep: documentSnapshot.data()['groep'],
                  afstand: documentSnapshot.data()['afstand'],
                ))
            .toList());
  }
}
