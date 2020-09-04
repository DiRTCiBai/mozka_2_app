import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';

Stream<List<CommentData>> Comments(SwimmerData2 swimmerData) {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  var commets = _db
      .collection('opmerkingen')
      .where('id', isEqualTo: swimmerData.id)
      .snapshots()
      .map((QuerySnapshot querySnapshot) => querySnapshot.docs
          .map(
            (DocumentSnapshot documentSnapshot) => CommentData(
              comment: documentSnapshot.data()['opmerking'],
              date: documentSnapshot.data()['datum'],
              titel: documentSnapshot.data()['titel'],
              detail: documentSnapshot.data()['detail'],
              trainer: documentSnapshot.data()['trainer'],
            ),
          )
          .toList());

  return commets;
}

class CommentData {
  String titel;
  String comment;
  String date;
  String detail;
  String trainer;
  CommentData({this.comment, this.date, this.titel, this.detail, this.trainer});
}
