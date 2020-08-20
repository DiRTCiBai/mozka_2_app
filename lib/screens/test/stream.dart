import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

Stream<ChartData> timedCounter() {
  StreamController<ChartData> controller = new StreamController<ChartData>();

  var test = ChartData(100, 25);

  controller.add(test); // Ask stream to send counter values as event.

  return controller.stream;
}

class ChartData {
  final int total;
  final int precences;

  ChartData(this.total, this.precences);
}
