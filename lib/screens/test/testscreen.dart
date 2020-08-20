import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';

class TestDonutPie extends StatelessWidget {
  static const String id = 'test';

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: SafeArea(
//        child: Column(
//          children: <Widget>[
//            Card(
//              color: Colors.white,
//              child: Container(
//                child: DonutPieChart(),
//                width: 300,
//                height: 300,
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class DonutPieChart extends StatelessWidget {
////  final List<charts.Series> seriesList;
////  final bool animate;
//  FireBaseInterface fireBaseInterface = FireBaseInterface();
//
//  DonutPieChart();
//
////  /// Creates a [PieChart] with sample data and no transition.
////  factory DonutPieChart.withSampleData() {
////    return new DonutPieChart(
////      _createSampleData(),
////      // Disable animations for image tests.
////      animate: false,
////    );
////  }
//
//  @override
//  Widget build(BuildContext context) {
//    return charts.PieChart(_createSampleData,
//        animate: false,
//        // Configure the width of the pie slices to 60px. The remaining space in
//        // the chart will be left as a hole in the center.
//        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60));
//  }
//
//  /// Create one series with sample hard coded data.
//  static List<charts.Series<Precences, int>> _createSampleData() {
//    int total =
//        75; //await fireBaseInterface.GetTotalPrecencesLength('4a0S9ZcIatIHjBpA6I0R');
//    int precences = 25;
//    //await fireBaseInterface.GetPrecencesLength('4a0S9ZcIatIHjBpA6I0R');
//
//    final data = [
//      Precences(1, precences),
//      Precences(2, total - precences),
//    ];
//
//    return [
//      new charts.Series<Precences, int>(
//        id: 'Sales',
//        domainFn: (Precences sales, _) => sales.total,
//        measureFn: (Precences sales, _) => sales.precences,
//        data: data,
//      )
//    ];
//  }

///// Sample linear data type.
//class Precences {
//  final int total;
//  final int precences;
//
//  Precences(this.total, this.precences);
//}
