import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/trainingen.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:mozka_2_app/versie_2/screens/training_screen/main_training_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TrainingenListview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Trainingen> trainingenlist = Provider.of<List<Trainingen>>(context);

    return ListView.builder(
        itemBuilder: (context, index) {
          var training = trainingenlist[index];

          var decodeData = jsonDecode(training.data);

          return Card(
            child: ListTile(
              leading: Text(training.datum.replaceRange(10, 23, '')),
              title: Text(training.type),
              subtitle: Text(training.trainer),
              trailing: Text(training.sterren.toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainTrainingScreen(
                      trainingen: decodeData,
                    ),
                  ),
                );
              },
              onLongPress: () {
                FirebaseFirestore _db = FirebaseFirestore.instance;

                _db.collection('trainingen').doc(training.datum).delete();
              },
            ),
          );
        },
        itemCount: trainingenlist.length);
  }
}
