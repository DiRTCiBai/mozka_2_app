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
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: Text(snapshot.data[index].titel),
                        trailing: Column(
                          children: <Widget>[
                            Text(snapshot.data[index].date),
                            Text(snapshot.data[index].trainer),
                          ],
                        ),
                        subtitle: Text(snapshot.data[index].detail),
                      ),
                      ListTile(title: Text(snapshot.data[index].comment)),
                    ],
                  ),
                );
              },
              itemCount: snapshot.data.length,
            );
          } else {
            return Text('loading');
          }
        });
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

class CommentData {
  String titel;
  String comment;
  String date;
  String detail;
  String trainer;
  CommentData({this.comment, this.date, this.titel, this.detail, this.trainer});
}
