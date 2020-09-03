import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void DeleteSwimmerFromFirestore(SwimmerData2 swimmerData) {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  _db.collection(kSaveSwimmerDataId).doc(swimmerData.id).delete();
}
