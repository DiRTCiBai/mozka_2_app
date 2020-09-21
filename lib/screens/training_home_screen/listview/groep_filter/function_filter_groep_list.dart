import 'package:mozka_2_app/modules/trainingen.dart';

List<Trainingen> GetGroepList(String groep, List<Trainingen> trainingenlist) {
  List<Trainingen> filterList = [];

  if (groep != null) {
    for (var training in trainingenlist) {
      if (training.groep == groep) {
        filterList.add(training);
      }
    }
    return filterList;
  } else {
    return trainingenlist;
  }
}
