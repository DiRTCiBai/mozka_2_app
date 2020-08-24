import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/versie_2/modules/time.dart';

void SavePrecencesToFirestore(List<SwimmerData2> swimmerlist) {
  String jaar = Time().GetYear();
  String maand = Time().GetMonth();
  String dag = Time().GetDay();

  Firestore _db = Firestore.instance;

  for (int i = 0; i < swimmerlist.length; i++) {
    _db
        .collection(jaar)
        .document(swimmerlist[i].id)
        .collection(maand)
        .document(dag)
        .setData({
      'dag': dag,
      'maand': maand,
      'aanwezig': swimmerlist[i].aanwezig,
      'groep': swimmerlist[i].groep,
    });
  }
}
