import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';

class GetComments extends StatelessWidget {
  SwimmerData2 swimmerData;

  GetComments({this.swimmerData});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: Comments(),
          builder: (BuildContext context,
              AsyncSnapshot<List<CommentData>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data[index].comment),
                      trailing: Text(snapshot.data[index].date),
                    ),
                  );
                },
                itemCount: snapshot.data.length,
              );
            } else {
              return Text('loading');
            }
          }),
    );
  }

  Stream<List<CommentData>> Comments() {
    Firestore _db = Firestore.instance;

    var commets = _db
        .collection('opmerkingen')
        .where('id', isEqualTo: swimmerData.id)
        .snapshots()
        .map((QuerySnapshot querySnapshot) => querySnapshot.documents
            .map(
              (DocumentSnapshot documentSnapshot) => CommentData(
                comment: documentSnapshot.data['opmerking'],
                date: documentSnapshot.data['datum'],
              ),
            )
            .toList());

    return commets;
  }
}

class CommentData {
  String comment;
  String date;
  CommentData({this.comment, this.date});
}
