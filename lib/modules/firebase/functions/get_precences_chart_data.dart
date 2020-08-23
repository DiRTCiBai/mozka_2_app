import 'package:mozka_2_app/screens/personal_swimmer_data/functions/chartdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/chartdata/properties.dart';

Future<ChartData> FirebaseInterfaceGetPrecencesChartData(
    ChartDataProperties chartDataProperties, Firestore _db) async {
  int numberOfdays = 0;
  int total = 0;

  var len = await _db
      .collection(chartDataProperties.jaar)
      .document(chartDataProperties.documentID)
      .collection(chartDataProperties.maand)
      .getDocuments();

  for (var x in len.documents) {
    var database = await _db
        .collection(chartDataProperties.jaar)
        .document(chartDataProperties.documentID)
        .collection(chartDataProperties.maand)
        .document(x.data['dag'])
        .get();

    if (database.data['groep'] == chartDataProperties.groep) {
      total++;
    }

    if (database.data['aanwezig'] &&
        database.data['groep'] == chartDataProperties.groep) {
//        print('${database.data['dag']} ${database.data['maand']}');
      numberOfdays++;
    }
  }

  print('$numberOfdays/$total');

  var res = ChartData(total, numberOfdays);
  return res;
}
