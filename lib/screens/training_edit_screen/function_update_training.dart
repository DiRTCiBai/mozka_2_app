import 'package:cloud_firestore/cloud_firestore.dart';

void SaveTraining(String data, int afstand, String trainingId) {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  if (data != null) {
    //update de training en de afstand als trainingdata niet 0 is
    _db.collection('trainingen').doc(trainingId).update({
      'training': data,
      'afstand': afstand,
    });
  }
}
