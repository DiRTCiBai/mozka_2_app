import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/widgets/swimmer_list/listview_swimmers.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';

class TestScreen extends StatelessWidget {
  static const String id = 'TestScreen';
  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: zwemList(),
    ));
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
            List<SwimmerData> zwemmerslijst = [];
            for (var document in zwemmerdocuments) {
              final voornaam = document.data['voornaam'];
              final achternaam = document.data['achternaam'];
              final geboortejaar = document.data['geboortejaar'];
              final email = document.data['email'];
              final geslacht = document.data['geslacht'];

              final zwemmer = SwimmerData(
                  voornaam: voornaam,
                  achernaam: achternaam,
                  geboortejaar: int.parse(geboortejaar),
                  email: email,
                  geslacht: geslacht);

              zwemmerslijst.add(zwemmer);
            }
            return ListviewSwimmer(
              swimmerDataList: zwemmerslijst,
            );
        }
      },
    );
  }
}
