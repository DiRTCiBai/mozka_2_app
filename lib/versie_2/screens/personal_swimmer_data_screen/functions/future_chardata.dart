import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'chardata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<ChartData> GetPrecencesChartData(
    {String year, SwimmerData2 swimmerData, String month}) async {
  Firestore _db = Firestore.instance;
  int numberOfdays = 0;
  int total = 0;

  var len = await _db
      .collection(year)
      .document(swimmerData.id)
      .collection(month)
      .getDocuments();

  print(len.documents.length);

  for (var data in len.documents) {
    var database = await _db
        .collection(year)
        .document(swimmerData.id)
        .collection(data.data['maand'])
        .document(data.data['dag'])
        .get();

    print(database.data['aanwezig']);

    if (database.data['groep'] == swimmerData.groep) {
      total++;
    }

    if (database.data['aanwezig'] &&
        database.data['groep'] == swimmerData.groep) {
      numberOfdays++;
    }
  }

  print('${swimmerData.voornaam} $total/$numberOfdays');
  var res = ChartData(total, numberOfdays);
  return res;
}
