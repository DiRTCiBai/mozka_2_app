import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/add_swimmer_screen.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/screens/test_screen.dart';

class SwimmersList extends StatefulWidget {
  static const String id = 'SwimmersList';

  @override
  _SwimmersListState createState() => _SwimmersListState();
}

class _SwimmersListState extends State<SwimmersList> {
  Firestore _firestore = Firestore.instance;

  List<SwimmerData> swimmers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final swimmer = await Navigator.pushNamed(context, AddSwimmers.id);

          SwimmerData swimmer1 = swimmer;
          setState(() {
            if (swimmer != null) {
              swimmers.add((swimmer));
              _firestore.collection('zwemmers').document().setData({
                'voornaam': swimmer1.voornaam,
                'achternaam': swimmer1.achernaam,
                'geboortejaar': swimmer1.geboortejaar.toString(),
                'email': swimmer1.email,
                'geslacht': swimmer1.geslacht.toString()
              });
            }
          });
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: zwemList(),
        ),
      ),
    );
  }
}
