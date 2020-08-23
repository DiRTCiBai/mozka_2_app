import 'package:flutter/material.dart';

import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'charts/donut_chart.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data/functions/chartdata.dart';
import 'package:mozka_2_app/modules/chartdata/properties.dart';

class PrecencesInfoCard extends StatelessWidget {
  final SwimmerData swimmerData;
  PrecencesInfoCard(this.swimmerData);

  FireBaseInterface fireBaseInterface = FireBaseInterface();
  ChartDataProperties chartDataProperties =
      ChartDataProperties(documentID: '', maand: '1', jaar: '2020', groep: 'E');

  @override
  Widget build(BuildContext context) {
    ChartDataProperties chartDataProperties = ChartDataProperties(
        documentID: swimmerData.ID,
        maand: '1',
        jaar: '2020',
        groep: swimmerData.groep);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<ChartData>(
            future:
                fireBaseInterface.GetPrecencesChartData(chartDataProperties),
            builder: (BuildContext context, AsyncSnapshot<ChartData> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Text('Totaal',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    DonutChart(
                      total: snapshot.data.total,
                      aanwezig: snapshot.data.precences,
                    ),
                  ],
                );
              } else {
                return Text('is loading');
              }
            },
          ),
        ),
      ),
    );
  }

  Future<ChartData> GetChartData(String documentID) async {
    var total = await fireBaseInterface.GetTotalPrecencesLength(documentID);
    var precences = await fireBaseInterface.GetPrecencesLength(documentID);

    return ChartData(total, precences);
  }
}
