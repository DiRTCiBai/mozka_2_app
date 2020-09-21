import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/time.dart';
import 'package:percent_indicator/percent_indicator.dart';

const kstyle = TextStyle(fontSize: 20.0);

class customDag extends StatelessWidget {
  PrecencesDetails precencesDetails = PrecencesDetails();
  final SwimmerData2 swimmerData;

  customDag({this.swimmerData});

  List<String> dag = ['Ma', 'Di', 'Wo', 'Do', 'Vr', 'Za', 'Zo'];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: precencesDetails.DetailLijst(swimmerData),
        builder:
            (BuildContext context, AsyncSnapshot<NumberOfWeekdagen> snapshot) {
          if (snapshot.hasData) {
            List<double> dagen = [0, 0, 0, 0, 0, 0, 0];
            List<Widget> colum = [];

            for (int i = 0; i < snapshot.data.tot.length; i++) {
              if (snapshot.data.aan[i] != 0) {
                dagen[i] = (snapshot.data.aan[i] / snapshot.data.tot[i] * 100);
              } else {
                dagen[i] = 0;
              }

              colum.add(CustomDagBar(
                percent: dagen[i],
                dag: dag[i],
              ));
            }

            return Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Aanwezigheden',
                      style: kstyle,
                    ),
                    Table(
                      columnWidths: {
                        0: FractionColumnWidth(0.13),
                        1: FractionColumnWidth(0.87),
                      },
                      //border: TableBorder.all(),
                      children: [
                        TableRow(children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              dag[0],
                              style: kstyle,
                            ),
                          )),
                          Center(
                            child: CustomDagBar(
                              percent: dagen[0],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              dag[1],
                              style: kstyle,
                            ),
                          )),
                          Center(
                            child: CustomDagBar(
                              percent: dagen[1],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              dag[2],
                              style: kstyle,
                            ),
                          )),
                          Center(
                            child: CustomDagBar(
                              percent: dagen[2],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              dag[3],
                              style: kstyle,
                            ),
                          )),
                          Center(
                            child: CustomDagBar(
                              percent: dagen[3],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              dag[4],
                              style: kstyle,
                            ),
                          )),
                          Center(
                            child: CustomDagBar(
                              percent: dagen[4],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              dag[5],
                              style: kstyle,
                            ),
                          )),
                          Center(
                            child: CustomDagBar(
                              percent: dagen[5],
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              dag[6],
                              style: kstyle,
                            ),
                          )),
                          Center(
                            child: CustomDagBar(
                              percent: dagen[6],
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else
            return CircularProgressIndicator();
        });
  }
}

class CustomDagBar extends StatelessWidget {
  final double percent;
  final String dag;

  CustomDagBar({this.percent, this.dag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: LinearPercentIndicator(
        width: MediaQuery.of(context).size.width * 0.75,
        animation: true,
        lineHeight: 25.0,
        animationDuration: 2000,
        percent: percent / 100,
        center: Text(
          "${percent.roundToDouble()}%",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        linearStrokeCap: LinearStrokeCap.roundAll,
        progressColor: Colors.green,
      ),
    );
  }
}

//class voor aantal aanwezigheden per dag te vinden
class PrecencesDetails {
  List<String> vergelijkWeekdagenLijst = [
    '${DateTime.monday}',
    '${DateTime.tuesday}',
    '${DateTime.wednesday}',
    '${DateTime.thursday}',
    '${DateTime.friday}',
    '${DateTime.saturday}',
    '${DateTime.sunday}'
  ];

  List<int> numberOfAanwezighedenWeekdagen = [0, 0, 0, 0, 0, 0, 0];
  List<int> numberOfAanwezighedenWeekdagenTotaal = [0, 0, 0, 0, 0, 0, 0];

  FirebaseFirestore _db = FirebaseFirestore.instance;
  String jaar = Time().GetYear() + 'test';

//functie zal data opslaan in NumberOfWeekdagen object en terug geven aan een futurebuilder
  Future<NumberOfWeekdagen> DetailLijst(SwimmerData2 swimmerData) async {
    await LoopThroughData(swimmerData);
    return ConvertDataToString();
  }

//functie zal de verzamelde gegevens omzetten naar een NumberOfWeekdagen object
  NumberOfWeekdagen ConvertDataToString() {
    NumberOfWeekdagen dataList = NumberOfWeekdagen(
        aan: numberOfAanwezighedenWeekdagen,
        tot: numberOfAanwezighedenWeekdagenTotaal);

    return dataList;
  }

//functie haalt gegvens van firestore die bij zwemmer horen en loopt door de gegevens
  Future<void> LoopThroughData(SwimmerData2 swimmerData) async {
    var data =
        await _db.collection(jaar).where('id', isEqualTo: swimmerData.id).get();

    for (var aanwezigheden in data.docs) {
      var weekdag = DateTime.parse(aanwezigheden.data()['timestamp']);

      LoopthroughDays(weekdag, aanwezigheden);
    }
  }

//fucntie kijkt voor alle gegevens of de dag gelijk is aan Ma-Zo
  void LoopthroughDays(DateTime weekdag, DocumentSnapshot aanwezigheden) {
    for (int dagIndex = 0;
        dagIndex < vergelijkWeekdagenLijst.length;
        dagIndex++) {
      if (weekdag.weekday.toString() == vergelijkWeekdagenLijst[dagIndex]) {
        CheckAanwezigheden(aanwezigheden.data(), dagIndex);
      }
    }
  }

//functie kijkt of zwemmer die dag aanwezig was en telt de aanwezigheden en het totaal
  void CheckAanwezigheden(Map<String, dynamic> aanwezigheden, int index) {
    if (aanwezigheden['aanwezig'] == true) {
      numberOfAanwezighedenWeekdagen[index]++;
      numberOfAanwezighedenWeekdagenTotaal[index]++;
    } else {
      numberOfAanwezighedenWeekdagenTotaal[index]++;
    }
  }
}

//class voor aanwezigheid gegevens in op te slaan
class NumberOfWeekdagen {
  final List<int> aan;
  final List<int> tot;

  NumberOfWeekdagen({this.aan, this.tot});
}
