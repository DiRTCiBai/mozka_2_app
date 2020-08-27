import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';

class TestDonutPie extends StatelessWidget {
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  static const String id = 'test';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.white,
            child: Container(
              child: DonutPieChart.withRandomData(),
              width: 300,
              height: 400,
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                FlatButton(
                  child: Text('druk mij'),
                  onPressed: () {},
                ),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
                Text('sdkljfdlkjfs'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory DonutPieChart.withRandomData() {
    return new DonutPieChart(_createRandomData());
  }

  /// Create random data.
  static List<charts.Series<LinearSales, int>> _createRandomData() {
    final random = new Random();

    final data = [
      new LinearSales(0, random.nextInt(100)),
      new LinearSales(1, random.nextInt(100)),
      new LinearSales(2, random.nextInt(100)),
      new LinearSales(3, random.nextInt(100)),
      new LinearSales(4, random.nextInt(100)),
      new LinearSales(5, random.nextInt(100)),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}