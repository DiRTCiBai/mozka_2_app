import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/modules/time.dart';
import 'package:mozka_2_app/constants/firestore_file_constants.dart';

void SavePrecencesToFirestore(List<SwimmerData2> swimmerlist, String groep) {
  String jaar = Time().GetYear() + kAanwezighedenFile;
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
          'naam': '${swimmerlist[i].voornaam} ${swimmerlist[i].achternaam}'
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
