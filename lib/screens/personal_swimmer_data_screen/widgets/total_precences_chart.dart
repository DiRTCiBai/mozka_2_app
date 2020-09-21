import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class TotalPrecencesChart extends StatelessWidget {
  final int total;
  final int aanwezig;
  static var data;
  static var series;
  double percentage;

  TotalPrecencesChart({this.total, this.aanwezig}) {
    percentage = (aanwezig / total) * 100;

    data = [
      DonutChartData(
          title: 'aanwezig', percentage: aanwezig, colors: Colors.green),
      DonutChartData(
          title: 'afwezig', percentage: total - aanwezig, colors: Colors.red)
    ];

    series = [
      new charts.Series(
        id: 'total',
        domainFn: (DonutChartData clickData, _) => clickData.title,
        measureFn: (DonutChartData clickData, _) => clickData.percentage,
        colorFn: (DonutChartData clickData, _) => clickData.color,
        data: data,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: 200.0,
      child: Stack(
        children: <Widget>[
          charts.PieChart(
            series,
            animate: true,
            animationDuration: Duration(milliseconds: 500),
            defaultRenderer: new charts.ArcRendererConfig(
              arcWidth: 30,
            ),
          ),
          Center(
            child: Text(
              "${percentage.round()}%",
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class DonutChartData {
  final String title;
  final int percentage;
  charts.Color color;

  DonutChartData({this.percentage, this.title, Color colors}) {
    this.color = charts.Color(
        r: colors.red, g: colors.green, b: colors.blue, a: colors.alpha);
  }
}
