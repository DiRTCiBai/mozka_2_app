import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';

class GetComments extends StatelessWidget {
  SwimmerData2 swimmerData;

  GetComments({this.swimmerData});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Comments(),
      builder:
          (BuildContext context, AsyncSnapshot<List<CommentData>> snapshot) {
        if (snapshot.hasData) {
          final opmerkingen = snapshot.data.reversed;
          List<CustomOpmerking> listOpmerkingen = [];

          for (var opmerking in opmerkingen) {
            final title = opmerking.titel;
            final trainer = opmerking.trainer;
            final datum = opmerking.date;
            final comment = opmerking.comment;
            final detail = opmerking.detail;

            final tempOpmerkingwidget = CustomOpmerking(
              title: title,
              trainer: trainer,
              datum: datum,
              opmerking: comment,
              detail: detail,
            );

            listOpmerkingen.add(tempOpmerkingwidget);
          }

          return Expanded(
            child: ListView(
              reverse: false,
              children: listOpmerkingen,
            ),
          );
        } else {
          return Text('loading');
        }
      },
    );
  }

  Stream<List<CommentData>> Comments() {
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
}

class CustomOpmerking extends StatelessWidget {
  final String title;
  final String trainer;
  final String datum;
  final String opmerking;
  final String detail;

  CustomOpmerking(
      {this.trainer, this.title, this.datum, this.opmerking, this.detail});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(trainer),
                Text(datum),
              ],
            ),
            subtitle: Text(detail),
          ),
          Divider(),
          ListTile(title: Text(opmerking)),
        ],
      ),
    );
  }
}

class CommentData {
  String titel;
  String comment;
  String date;
  String detail;
  String trainer;
  CommentData({this.comment, this.date, this.titel, this.detail, this.trainer});
}
