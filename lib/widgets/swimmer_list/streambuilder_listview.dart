import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/widgets/swimmer_list/listview_swimmers.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';

class StreamBuilderListView extends StatelessWidget {
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
            final swimmersDocuments = snapshot.data.documents;

            List<SwimmerData> swimmerDataList = [];

            for (var document in swimmersDocuments) {
              final swimmer = SwimmerData(
                voornaam: document.data['voornaam'],
                achernaam: document.data['achternaam'],
                geboortejaar: int.parse(document.data['geboortejaar']),
                email: document.data['email'],
                geslacht: document.data['geslacht'],
                ID: document.data['id'],
              );

              swimmerDataList.add(swimmer);
            }
            return ListviewSwimmer(
              swimmerDataList: swimmerDataList,
            );
        }
      },
    );
  }
}
