import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/time.dart';

//widget dat grafiek mooi weergeeft
class CustomFutureBuilder extends StatelessWidget {
  final SwimmerData2 swimmerData;

  CustomFutureBuilder({this.swimmerData});
  PrecencesDetails precencesDetails = PrecencesDetails();

  double _height = 300;
  double _width = double.infinity;
  double _marginCard = 10;
  double _marginTitel = 10;
  double _fontsize = 22.3;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(_marginCard),
      child: Container(
        width: _width,
        height: _height,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(_marginTitel),
              child: Text(
                'Aanwezigheden Weekdagen',
                style:
                    TextStyle(fontSize: _fontsize, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: precencesDetails.DetailLijst(swimmerData),
                  builder: (BuildContext context,
                      AsyncSnapshot<NumberOfWeekdagen> snapshot) {
                    if (snapshot.hasData) {
                      return StackedBarChart(
                        aan: snapshot.data.aan,
                        tot: snapshot.data.tot,
                      );
                    } else
                      return CircularProgressIndicator();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

//widget dat een staaf grafiek weergeeft
class StackedBarChart extends StatelessWidget {
  static var series;
  static var data;
  static var total;

  var colorAanwezig = Colors.green;
  var colorTotaal = Colors.red;

  final List<int> aan;
  final List<int> tot;

  StackedBarChart({this.aan, this.tot}) {
    data = [
      ChartData('Ma', aan[0], colorAanwezig),
      ChartData('Di', aan[1], colorAanwezig),
      ChartData('Wo', aan[2], colorAanwezig),
      ChartData('Do', aan[3], colorAanwezig),
      ChartData('Vr', aan[4], colorAanwezig),
      ChartData('Za', aan[5], colorAanwezig),
      ChartData('Zo', aan[6], colorAanwezig),
    ];
    total = [
      ChartData('Ma', tot[0] - aan[0], colorTotaal),
      ChartData('Di', tot[1] - aan[1], colorTotaal),
      ChartData('Wo', tot[2] - aan[2], colorTotaal),
      ChartData('Do', tot[3] - aan[3], colorTotaal),
      ChartData('Vr', tot[4] - aan[4], colorTotaal),
      ChartData('Za', tot[5] - aan[5], colorTotaal),
      ChartData('Zo', tot[6] - aan[6], colorTotaal),
    ];
    series = [
      charts.Series<ChartData, String>(
        id: 'aanwezig',
        domainFn: (ChartData sales, _) => sales.dag,
        measureFn: (ChartData sales, _) => sales.aantalAanwezigheden,
        colorFn: (ChartData sales, _) => sales.color,
        data: total,
      ),
      charts.Series<ChartData, String>(
        id: 'totaal',
        domainFn: (ChartData sales, _) => sales.dag,
        measureFn: (ChartData sales, _) => sales.aantalAanwezigheden,
        colorFn: (ChartData sales, _) => sales.color,
        data: data,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      series,
      animate: true,
      barGroupingType: charts.BarGroupingType.stacked,
    );
  }
}

//class voor data van detail aanwezigheid grafiek
class ChartData {
  final String dag;
  final int aantalAanwezigheden;
  charts.Color color;

  ChartData(this.dag, this.aantalAanwezigheden, Color colors) {
    this.color = charts.Color(
        r: colors.red, g: colors.green, b: colors.blue, a: colors.alpha);
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
