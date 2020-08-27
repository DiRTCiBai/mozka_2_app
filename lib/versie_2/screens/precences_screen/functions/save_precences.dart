import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/versie_2/modules/time.dart';

void SavePrecencesToFirestore(List<SwimmerData2> swimmerlist) {
  String jaar = Time().GetYear() + 'test';
  String maand = Time().GetMonth();
  String dag = Time().GetDay();
  var now = new DateTime.now();
  Firestore _db = Firestore.instance;

  for (int i = 0; i < swimmerlist.length; i++) {
//    _db
////        .collection(jaar)
////        .document(swimmerlist[i].id)
////        .collection(maand)
////        .document(dag)
////        .setData({
////      'dag': dag,
////      'maand': maand,
////      'aanwezig': swimmerlist[i].aanwezig,
////      'groep': swimmerlist[i].groep,
////    });
    _db.collection(jaar).document(swimmerlist[i].id + '$dag - $maand').setData(
      {
        'timestamp': now.toString(),
        'groep': swimmerlist[i].groep,
        'id': swimmerlist[i].id,
        'aanwezig': swimmerlist[i].aanwezig,
      },
    );
  }
}