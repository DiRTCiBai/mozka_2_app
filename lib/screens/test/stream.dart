import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';
import 'dart:async';

FireBaseInterface fireBaseInterface = FireBaseInterface();

Stream<ChartData> timedCounter() async* {
  var total =
      await fireBaseInterface.GetTotalPrecencesLength('4a0S9ZcIatIHjBpA6I0R');
  var precences =
      await fireBaseInterface.GetPrecencesLength('4a0S9ZcIatIHjBpA6I0R');

  yield ChartData(total, precences);
//  for (int i = 0; i < 11; i++) {
//    await Future.delayed(const Duration(seconds: 1));
//    yield i;
//  }
}

class ChartData {
  final int total;
  final int precences;

  ChartData(this.total, this.precences);
}
