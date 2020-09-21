import 'package:flutter/cupertino.dart';

class TrainingSaveData extends ChangeNotifier {
  String _datum;
  String _type;
  String _slag;
  String _groep;

  void SetDatum(String datum) {
    _datum = datum;
    notifyListeners();
  }

  void SetType(String type) {
    _type = type;
    notifyListeners();
  }

  void SetSlag(String slag) {
    _slag = slag;
    notifyListeners();
  }

  void SetGroep(String groep) {
    _groep = groep;
    notifyListeners();
  }

  String GetDatum() {
    return _datum;
  }

  String GetType() {
    return _type;
  }

  String GetSlag() {
    return _slag;
  }

  String GetGroep() {
    return _groep;
  }
}
