import 'package:flutter/cupertino.dart';

class TrainingSaveData extends ChangeNotifier {
  String _datum;
  String _type;
  String _slag;

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

  String GetDatum() {
    return _datum;
  }

  String GetType() {
    return _type;
  }

  String GetSlag() {
    return _slag;
  }
}
