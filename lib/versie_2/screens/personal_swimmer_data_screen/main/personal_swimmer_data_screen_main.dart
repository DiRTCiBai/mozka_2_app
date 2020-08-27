import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/basic_info_card.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/screens/edit_swimmer_data_screen/main/edit_swimmer_data_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/total_precences_chart.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/functions/chardata.dart';
import 'package:mozka_2_app/versie_2/modules/time.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/functions/future_chardata.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/functions/future_chartdata_year.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/get_comments.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/group_info_card.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/card_titles.dart';
import 'package:mozka_2_app/root/constants.dart';

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditSwimmerDataScreenMain(
                  swimmerData: swimmerData,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CircleAvatar(
              backgroundColor:
                  swimmerData.geslacht == 'man' ? kmanColor : kfemakeColor,
              radius: 50.0,
              child: Text(
                '${swimmerData.voornaam[0].toUpperCase()}${swimmerData.achternaam[0].toUpperCase()}',
                style: TextStyle(fontSize: 45, color: Colors.white),
              ),
            ),
          ),
          BasicInfoCard(
            swimmerData: swimmerData,
          ),
          CardTitles(
            title: 'Groep info',
          ),
          GroupInfoCard(
            swimmerData: swimmerData,
          ),
          CardTitles(
            title: 'Opmerkingen',
          ),
          FutureBuilder(
              future: Aanwezigheden(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data);
                } else {
                  return Text('niet goed');
                }
              }),

//              if (snapshot.hasData) {),

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

          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: GetComments(
                swimmerData: swimmerData,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> Aanwezigheden() async {
    String jaar = Time().GetYear() + 'test';
    Firestore _db = Firestore.instance;
    int numberOfPrecences = 0;

    var data = await _db
        .collection(jaar)
        .where('id', isEqualTo: swimmerData.id)
        .getDocuments();

    for (var x in data.documents) {
      if (x.data['aanwezig'] == true && x.data['groep'] == swimmerData.groep) {
        numberOfPrecences++;
      }
    }

    return '${numberOfPrecences.toString()} / ${data.documents.length}';
  }
}
