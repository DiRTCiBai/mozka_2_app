import 'package:flutter/cupertino.dart';

class FilterDatabase extends ChangeNotifier {
  String _filter = 'f';

  void SetFilter(String set) {
    _filter = set;
    notifyListeners();
  }

  String GetFilter() {
    return _filter;
  }
}
