import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/screens/edit_swimmer_data_screen/main/edit_swimmer_data_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/total_precences_chart.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/functions/chardata.dart';
import 'package:mozka_2_app/versie_2/modules/time.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/functions/future_chardata.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/functions/future_chartdata_year.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/get_comments.dart';

class PersonalSwimmerDataSCreenMain extends StatelessWidget {
  static const String id = 'PersonalSwimmerDataSCreenMain';
  final SwimmerData2 swimmerData;

  PersonalSwimmerDataSCreenMain({this.swimmerData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Persoonlijke gegevens'),
      ),
      body: Column(
        children: <Widget>[
          Text('${swimmerData.voornaam}'),
          Text('${swimmerData.achternaam}'),
          Text('${swimmerData.geboortejaar}'),
          Text('${swimmerData.email}'),
          Text('${swimmerData.geslacht}'),
          Text('${swimmerData.groep}'),
          FlatButton(
            child: Text('Edit'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditSwimmerDataScreenMain(
                  swimmerData: swimmerData,
                ),
              ),
            ),
//          FutureBuilder(
//            future: GetPrecencesChartData(
//                year: Time().GetYear(),
//                month: Time().GetMonth(),
//                swimmerData: swimmerData),
//            builder: (BuildContext context, AsyncSnapshot<ChartData> snapshot) {
//              if (snapshot.hasData) {
//                return Column(
//                  children: <Widget>[
//                    Text('maand'),
//                    TotalPrecencesChart(
//                      total: snapshot.data.total,
//                      aanwezig: snapshot.data.precences,
//                    ),
//                  ],
//                );
//              } else {
//                return CircularProgressIndicator();
//              }
//            },
//          ),
//          FutureBuilder(
//            future: GetPrecencesChartDataMonth(
//                year: Time().GetYear(),
//                month: Time().GetMonth(),
//                swimmerData: swimmerData),
//            builder: (BuildContext context, AsyncSnapshot<ChartData> snapshot) {
//              if (snapshot.hasData) {
//                return Column(
//                  children: <Widget>[
//                    Text('Jaar'),
//                    TotalPrecencesChart(
//                      total: snapshot.data.total,
//                      aanwezig: snapshot.data.precences,
//                    ),
//                  ],
//                );
//              } else {
//                return CircularProgressIndicator();
//              }
//            },
//          ),
          ),
          GetComments(
            swimmerData: swimmerData,
          ),
        ],
      ),
    );
  }
}
