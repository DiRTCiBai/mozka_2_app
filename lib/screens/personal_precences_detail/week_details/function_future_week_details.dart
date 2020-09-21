import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/modules/time.dart';
import 'function_percentage_week_days.dart';

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
    return ConvertDataToPercentage();
  }

//functie zal de verzamelde gegevens omzetten naar een NumberOfWeekdagen object
  NumberOfWeekdagen ConvertDataToPercentage() {
    List<double> percentage = [];

    print('zit hier');
    print(numberOfAanwezighedenWeekdagenTotaal.length);
    for (int index = 0;
        index < numberOfAanwezighedenWeekdagenTotaal.length;
        index++) {
      double temp = numberOfAanwezighedenWeekdagen[index] /
          numberOfAanwezighedenWeekdagenTotaal[index];

      if (numberOfAanwezighedenWeekdagen[index] != 0)
        percentage.add(temp);
      else
        percentage.add(0);
    }
    NumberOfWeekdagen dataList = NumberOfWeekdagen(
      percentage: percentage,
    );

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
