import 'package:flutter/cupertino.dart';

import 'class_decoder_data.dart';

class DecoderDatabase extends ChangeNotifier {
  List<DecoderData> _decoderData = [];
  int _totAfstand = 0;

  void AddDecoderData(DecoderData data) {
    _decoderData.add(data);
    _totAfstand += data.afstand;
    notifyListeners();
  }

  List<DecoderData> GetDecoderData() {
    return _decoderData;
  }

  void ClearDecoderData() {
    _decoderData.clear();
    _totAfstand = 0;
    notifyListeners();
  }

  int GetTotAfstand() {
    return _totAfstand;
  }
}
