import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/widgets/swimmer_list/listview_swimmers.dart';
import 'package:mozka_2_app/modules/data_swimmers.dart';
import 'package:mozka_2_app/modules/gender.dart';

class TestScreen extends StatelessWidget {
  static const String id = 'TestScreen';
  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: zwemList(),
//      child: StreamBuilder<QuerySnapshot>(
//        stream: _firestore.collection('zwemmers').snapshots(),
//        builder: (BuildContext context, snapshot) {
//          if (snapshot.hasData) {
//            final documents = snapshot.data.documents;
//            List<Swimmers> zwemmerslijst = [];
//            List<Text> text = [];
//
//            for (var document in documents) {
//              final voornaam = document.data['voornaam'];
//              final achternaam = document.data['achternaam'];
//              final geboortejaar = document.data['geboortejaar'];
//              final email = document.data['email'];
//              final geslacht = document.data['geslacht'];
//
//              final zwemmer = Swimmers(
//                  voornaam: voornaam,
//                  achernaam: achternaam,
//                  geboortejaar: int.parse(geboortejaar),
//                  email: email,
//                  geslacht: Gender.man);
//
//              zwemmerslijst.add(zwemmer);
//              text.add(Text('$voornaam'));
//            }
////                return Expanded(
////                  child: SwimList(
////                    swimmers: zwemmerslijst,
////                  ),
////                );
//            return Column(
//              children: text,
//            );
//          }
//        },
////                itemCount: zwemmerDataCount,
//      ),
    ));
  }
}

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('zwemmers').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  title: new Text(document['voornaam']),
                  subtitle: new Text(document['achternaam']),
                );
              }).toList(),
            );
        }
      },
    );
  }
}

class zwemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('zwemmers').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            final zwemmerdocuments = snapshot.data.documents;
            List<Swimmers> zwemmerslijst = [];
            for (var document in zwemmerdocuments) {
              final voornaam = document.data['voornaam'];
              final achternaam = document.data['achternaam'];
              final geboortejaar = document.data['geboortejaar'];
              final email = document.data['email'];
              final geslacht = document.data['geslacht'];

              final zwemmer = Swimmers(
                  voornaam: voornaam,
                  achernaam: achternaam,
                  geboortejaar: int.parse(geboortejaar),
                  email: email,
                  geslacht: Gender.man);

              zwemmerslijst.add(zwemmer);
            }
            return SwimList(
              swimmers: zwemmerslijst,
            );
        }
      },
    );
  }
}
