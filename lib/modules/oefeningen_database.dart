import 'package:flutter/cupertino.dart';

class OefeningenDatabase extends ChangeNotifier {
  List<OefeningenData> _lijst = [];
  int _aantalOefeningen = 0;
  bool save = false;

  void Save() {
    save = true;
    notifyListeners();
  }

  void ExpanedList() {
    _aantalOefeningen++;
    _lijst.add(OefeningenData(afstand: 0, oefening: ''));
    notifyListeners();
  }

  void AddOef(OefeningenData oefeningenData, int index) {
    _lijst[index] = oefeningenData;
  }

  int GetAantalOefeningen() {
    return _aantalOefeningen;
  }

  void ClearData() {
    _aantalOefeningen = 0;
    _lijst.clear();
    save = false;
  }

  void ClearSave() {
    save = false;
  }

  List<OefeningenData> GetLijst() {
    return _lijst;
  }
}

class OefeningenData {
  int afstand;
  String oefening;

  OefeningenData({this.afstand, this.oefening});
}
