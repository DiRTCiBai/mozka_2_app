import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'chardata.dart';
import 'package:mozka_2_app/versie_2/modules/time.dart';

Future<ChartData> Aanwezigheden(SwimmerData2 swimmerData) async {
  String jaar = Time().GetYear() + 'test';
  FirebaseFirestore _db = FirebaseFirestore.instance;
  int numberOfPrecences = 0;

  var data =
      await _db.collection(jaar).where('id', isEqualTo: swimmerData.id).get();

  for (var x in data.docs) {
    if (x.data()['aanwezig'] == true &&
        x.data()['groep'] == swimmerData.groep) {
      numberOfPrecences++;
    }
  }

  return ChartData(data.docs.length, numberOfPrecences);
  // '${numberOfPrecences.toString()} / ${data.documents.length}';
}
