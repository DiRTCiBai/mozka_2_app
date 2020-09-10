import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/constants/constants.dart';

List<SwimmerData2> FilterSwimmerList(
    String filterValue, List<SwimmerData2> swimmerlist) {
  List<SwimmerData2> PreGroep = [];
  List<SwimmerData2> FGroep = [];
  List<SwimmerData2> EGroep = [];
  List<SwimmerData2> DGroep = [];
  List<SwimmerData2> CGroep = [];
  List<SwimmerData2> BGroep = [];
  List<SwimmerData2> AGroep = [];

  for (var swimmer in swimmerlist) {
    if (swimmer.groep == 'f') {
      FGroep.add(swimmer);
    } else if (swimmer.groep == kGroepPre) {
      PreGroep.add(swimmer);
    } else if (swimmer.groep == 'e') {
      EGroep.add(swimmer);
    } else if (swimmer.groep == 'd') {
      DGroep.add(swimmer);
    } else if (swimmer.groep == 'c') {
      CGroep.add(swimmer);
    } else if (swimmer.groep == 'b') {
      BGroep.add(swimmer);
    } else if (swimmer.groep == 'a') {
      AGroep.add(swimmer);
    }
  }
  print(filterValue);
  if (filterValue == kGroepPre) return PreGroep;
  if (filterValue == 'f') return FGroep;
  if (filterValue == 'e') return EGroep;
  if (filterValue == 'd') return DGroep;
  if (filterValue == 'c') return CGroep;
  if (filterValue == 'b') return BGroep;
  if (filterValue == 'a') return AGroep;
  if (filterValue == 'alle') return swimmerlist;
}
