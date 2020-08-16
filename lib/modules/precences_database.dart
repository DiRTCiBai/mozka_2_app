import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';

class PrecencesDatabase extends ChangeNotifier {
  List<PrecencesData> _precencesList = [];

  void AddToList(PrecencesData precencesData) {
    _precencesList.add(precencesData);
    notifyListeners();
  }

  void ClearList() {
    _precencesList.clear();
    notifyListeners();
  }

  int GetLength() {
    return _precencesList.length;
  }

  List<PrecencesData> GetList() {
    return _precencesList;
  }
}
