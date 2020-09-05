import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/versie_2/modules/time.dart';

void SavePrecencesToFirestore(List<SwimmerData2> swimmerlist, String groep) {
  String jaar = Time().GetYear() + 'test';
  String maand = Time().GetMonth();
  String dag = Time().GetDay();
  var now = new DateTime.now();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  for (int i = 0; i < swimmerlist.length; i++) {
    if (swimmerlist[i].groep == groep) {
      _db.collection(jaar).doc(swimmerlist[i].id + '$dag - $maand').set(
        {
          'timestamp': now.toString(),
          'groep': swimmerlist[i].groep,
          'id': swimmerlist[i].id,
          'aanwezig': swimmerlist[i].aanwezig,
          'datum': '$dag$maand${Time().GetYear()}',
        },
      );
    } else if (groep == 'alle') {
      _db.collection(jaar).doc(swimmerlist[i].id + '$dag - $maand').set(
        {
          'timestamp': now.toString(),
          'groep': swimmerlist[i].groep,
          'id': swimmerlist[i].id,
          'aanwezig': swimmerlist[i].aanwezig,
          'datum': '$dag$maand${Time().GetYear()}',
        },
      );
    }
  }
}
