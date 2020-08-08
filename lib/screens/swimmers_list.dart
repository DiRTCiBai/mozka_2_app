import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/swimmer_list/listview_swimmers.dart';
import 'package:mozka_2_app/screens/add_swimmers.dart';
import 'package:mozka_2_app/modules/data_swimmers.dart';
import 'package:mozka_2_app/modules/gender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SwimmersList extends StatefulWidget {
  static const String id = 'SwimmersList';

  @override
  _SwimmersListState createState() => _SwimmersListState();
}

class _SwimmersListState extends State<SwimmersList> {
  Firestore _firestore = Firestore.instance;

  List<Swimmers> swimmers = [
    Swimmers(
        voornaam: 'sam',
        achernaam: 'beyens',
        geboortejaar: 1998,
        email: 'sam.beyens@hotmail.com',
        geslacht: Gender.man),
  ];

  void GetData() async {
    final swimmerData = await _firestore.collection('zwemmers').getDocuments();
    for (var data in swimmerData.documents) {
      print(data.data);
    }
  }

  void GetStreamData() async {
    await for (var snapshot in _firestore.collection('zwemmers').snapshots()) {
      for (var data in snapshot.documents) {
        print(data.data);
      }
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
//          final swimmer = await Navigator.pushNamed(context, AddSwimmers.id);
//
//          Swimmers swimmer1 = swimmer;
//          setState(() {
//            if (swimmer != null) {
//              swimmers.add((swimmer));
//              _firestore.collection('zwemmers').document().setData({
//                'voornaam': swimmer1.voornaam,
//                'achternaam': swimmer1.achernaam,
//                'geboortejaar': swimmer1.geboortejaar.toString(),
//                'email': swimmer1.email,
//                'geslacht': swimmer1.geslacht.toString()
//              });
//            }
//          });
          GetStreamData();
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: SwimList(swimmers: swimmers),
        ),
      ),
    );
  }
}
