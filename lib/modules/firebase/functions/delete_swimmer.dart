import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';

void FirebaseInterfaceDeleteSwimmer(SwimmerData swimmerData, Firestore _db) {
  _db.collection('zwemmers').document(swimmerData.ID).delete();
}
