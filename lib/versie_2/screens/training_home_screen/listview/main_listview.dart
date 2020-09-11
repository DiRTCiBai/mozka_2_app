import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/trainingen.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:mozka_2_app/versie_2/screens/training_screen/main_training_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'groep_filter/function_filter_groep_list.dart';
import 'package:mozka_2_app/versie_2/modules/filter_database.dart';
import 'package:mozka_2_app/versie_2/screens/training_home_screen/constants.dart';

class TrainingenListview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Trainingen> trainingenlist = Provider.of<List<Trainingen>>(context);
    String groep = Provider.of<FilterDatabase>(context).GetFilter();
    var groepList = GetGroepList(groep, trainingenlist);

    return ListView.builder(
        itemBuilder: (context, index) {
          var training = groepList[index];

          return Card(
            child: ListTile(
              leading: Text(
                training.type,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              title: Text(
                training.slag,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              subtitle: Text('${training.afstand.toString()}m'),
              trailing: Text(training.datum.replaceRange(10, 23, '')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainTrainingScreen(
                      trainingen: jsonDecode(training.data),
                    ),
                  ),
                );
              },
              onLongPress: () {
                print(groep);
                FirebaseFirestore _db = FirebaseFirestore.instance;

                _db
                    .collection(kSaveColection)
                    .doc('${groep.toUpperCase()}${training.datum}')
                    .delete();
              },
            ),
          );
        },
        itemCount: groepList.length);
  }
}
