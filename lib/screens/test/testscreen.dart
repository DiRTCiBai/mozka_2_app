import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';
import 'package:mozka_2_app/modules/chartdata/properties.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data/functions/chartdata.dart';

class TestDonutPie extends StatelessWidget {
  static const String id = 'test';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: TestScreen(),
      )),
    );
  }
}

class TestScreen extends StatefulWidget {
  static const String jaar = '2020';

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  ChartDataProperties chartDataProperties = ChartDataProperties(
      documentID: 'sam', maand: '1', jaar: '2020', groep: 'E');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: fireBaseInterface.GetPrecencesChartData(chartDataProperties),
        builder: (BuildContext context, AsyncSnapshot<ChartData> snapshot) {
          if (snapshot.hasData) {
//                return Text('Chart');
            if (snapshot.data.total == 0) {
              return Text('loading');
            }
            return DonutChart(
              total: snapshot.data.total,
              aanwezig: snapshot.data.precences,
            );
          } else {
            return Text('geen chart');
          }
        },
      ),
    );
  }

//  void GetPrecencesDateBygroup(
//      {String maand, String naam, String groep}) async {
//    var len = await _db
//        .collection(TestScreen.jaar)
//        .document(this.naam)
//        .collection(this.maand)
//        .getDocuments();
//
//    for (var x in len.documents) {
//      var database = await _db
//          .collection(TestScreen.jaar)
//          .document(this.naam)
//          .collection(this.maand)
//          .document(x.data['dag'])
//          .get();
//
//      if (database.data['groep'] == this.groep && database.data['aanwezig']) {
//        print(
//            ' ${database.data['dag']}/${database.data['maand']} - ${database.data['groep']} - ${database.data['aanwezig']}');
//      }
//    }
//  }

//  Future<ChartData> GetPrecencesByMonth(
//      {String maand, String naam, String groep}) async {
//    int numberOfdays = 0;
//    int total = 0;
//
//    var len = await _db
//        .collection(TestScreen.jaar)
//        .document(naam)
//        .collection(maand)
//        .getDocuments();
//
//    for (var x in len.documents) {
//      var database = await _db
//          .collection(TestScreen.jaar)
//          .document(naam)
//          .collection(maand)
//          .document(x.data['dag'])
//          .get();
//
//      if (database.data['groep'] == groep) {
//        total++;
//      }
//
//      if (database.data['aanwezig'] && database.data['groep'] == groep) {
////        print('${database.data['dag']} ${database.data['maand']}');
//        numberOfdays++;
//      }
//    }
//
//    print('$numberOfdays/$total');
//
//    var res = ChartData(total, numberOfdays);
//    return res;
//  }

//  void GetPrecencesByDay({String maand, String naam, String groep}) async {
//    var len = await _db
//        .collection(TestScreen.jaar)
//        .document(this.naam)
//        .collection(this.maand)
//        .getDocuments();
//
//    for (var x in len.documents) {
//      var database = await _db
//          .collection(TestScreen.jaar)
//          .document(this.naam)
//          .collection(this.maand)
//          .document(x.data['dag'])
//          .get();
//
//      if (database.data['groep'] == this.groep) {
//        print(
//            ' ${database.data['dag']}/${database.data['maand']} - ${database.data['groep']} - ${database.data['aanwezig']}');
//      }
//    }
//  }

//  void AddPrecences() {
//    _db
//        .collection(TestScreen.jaar)
//        .document(naam)
//        .collection(maand)
//        .document(dag)
//        .setData({
//      'dag': dag,
//      'maand': maand,
//      'aanwezig': aanwezig,
//      'groep': groep,
//    });
//
//    print('$dag $maand ${TestScreen.jaar}');
//  }
}

class DonutChart extends StatelessWidget {
  final int total;
  final int aanwezig;
  static var data;
  static var series;
  double percentage;

  DonutChart({this.total, this.aanwezig}) {
    percentage = (aanwezig / total) * 100;

    data = [
      DonutChartData(
          title: 'aanwezig', percentage: aanwezig, colors: Colors.green),
      DonutChartData(
          title: 'afwezig', percentage: total - aanwezig, colors: Colors.red)
    ];

    series = [
      new charts.Series(
        id: 'Clicks',
        domainFn: (DonutChartData clickData, _) => clickData.title,
        measureFn: (DonutChartData clickData, _) => clickData.percentage,
        colorFn: (DonutChartData clickData, _) => clickData.color,
        data: data,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: 200.0,
      child: Stack(
        children: <Widget>[
          charts.PieChart(
            series,
            animate: true,
            animationDuration: Duration(milliseconds: 500),
            defaultRenderer: new charts.ArcRendererConfig(
              arcWidth: 30,
            ),
          ),
          Center(
            child: Text(
              "${percentage.round()}%",
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class DonutChartData {
  final String title;
  final int percentage;
  charts.Color color;

  DonutChartData({this.percentage, this.title, Color colors}) {
    this.color = charts.Color(
        r: colors.red, g: colors.green, b: colors.blue, a: colors.alpha);
  }
}

//Column(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//TextField(
//decoration: InputDecoration(
//labelText: 'Dag',
//),
//keyboardType: TextInputType.number,
//controller: myController1,
//),
//TextField(
//decoration: InputDecoration(
//labelText: 'Maand',
//),
//keyboardType: TextInputType.number,
//controller: myController2,
//),
//TextField(
//decoration: InputDecoration(
//labelText: 'Naam',
//),
//controller: myController3,
//),
//TextField(
//decoration: InputDecoration(
//labelText: 'Groep',
//),
//controller: myController4,
//),
//FlatButton(
//child: Text('aanwezig'),
//onPressed: () {
//setState(() {
//aanwezig = !aanwezig;
//});
//},
//color: aanwezig ? Colors.green : Colors.white,
//),
//FlatButton(
//child: Text('save'),
//onPressed: () {
//dag = myController1.text;
//maand = myController2.text;
//naam = myController3.text;
//groep = myController4.text;
//// save data
//_db
//    .collection(TestScreen.jaar)
//    .document(naam)
//    .collection(maand)
//    .document(dag)
//    .setData({
//'dag': dag,
//'maand': maand,
//'aanwezig': aanwezig,
//'groep': groep,
//}); //nog groep toevoegen
//
////              myController1.clear();
////              myController2.clear();
////              myController3.clear();
//print('$dag $maand ${TestScreen.jaar}');
//},
//),
