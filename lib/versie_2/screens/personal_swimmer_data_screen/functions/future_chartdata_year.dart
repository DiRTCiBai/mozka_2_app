import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'chardata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<ChartData> GetPrecencesChartDataMonth(
    {String year, SwimmerData2 swimmerData, String month}) async {
  Firestore _db = Firestore.instance;
  int numberOfdays = 0;
  int total = 0;

  List<int> precencesYearList = [];

  for (int i = 1; i < 13; i++) {
    var exist = await _db
        .collection(year)
        .document(swimmerData.id)
        .collection(i.toString())
        .getDocuments();
    for (var x in exist.documents) {
      if (x.data['maand'] == i.toString()) {
        precencesYearList.add(i);
        break;
      }
      ;
    }
  }

  //print(precencesYearList.length);

  for (var maand in precencesYearList) {
    var lenMonth = await _db
        .collection(year)
        .document(swimmerData.id)
        .collection(maand.toString())
        .getDocuments();

    //print(lenMonth.documents.length);

    for (var data in lenMonth.documents) {
      var database = await _db
          .collection(year)
          .document(swimmerData.id)
          .collection(data.data['maand'])
          .document(data.data['dag'])
          .get();

      if (database.data['groep'] == swimmerData.groep) {
        total++;
      }

      if (database.data['aanwezig'] &&
          database.data['groep'] == swimmerData.groep) {
        numberOfdays++;
      }

      //print(total);
    }
  }

  print('${swimmerData.voornaam} $total/$numberOfdays');

  var res = ChartData(total, numberOfdays);
  return res;
}
