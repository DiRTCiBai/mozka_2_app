import 'package:mozka_2_app/screens/personal_swimmer_data/functions/chartdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/chartdata/properties.dart';

Future<ChartData> FirebaseInterfaceGetPrecencesChartData(
    ChartDataProperties chartDataProperties, Firestore _db) async {
  int numberOfdays = 0;
  int total = 0;

  var len = await _db
      .collection(chartDataProperties.jaar)
      .doc(chartDataProperties.documentID)
      .collection(chartDataProperties.maand)
      .get();

  for (var x in len.docs) {
    var database = await _db
        .collection(chartDataProperties.jaar)
        .doc(chartDataProperties.documentID)
        .collection(chartDataProperties.maand)
        .doc(x.data()['dag'])
        .get();

    if (database.data()['groep'] == chartDataProperties.groep) {
      total++;
    }

    if (database.data()['aanwezig'] &&
        database.data()['groep'] == chartDataProperties.groep) {
//        print('${database.data['dag']} ${database.data['maand']}');
      numberOfdays++;
    }
  }

  print('$numberOfdays/$total');

  var res = ChartData(total, numberOfdays);
  return res;
}
