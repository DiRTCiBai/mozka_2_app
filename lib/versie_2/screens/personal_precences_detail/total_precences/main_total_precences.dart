import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'future_chartdata.dart';
import 'chardata.dart';

class TotalPrecencesIndicator extends StatelessWidget {
  final SwimmerData2 swimmerData;

  TotalPrecencesIndicator({this.swimmerData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Aanwezigheden(swimmerData),
      builder: (BuildContext context, AsyncSnapshot<ChartData> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.total != 0) {
            double percentage = snapshot.data.precences / snapshot.data.total;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularPercentIndicator(
                  radius: MediaQuery.of(context).size.width * 0.5,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: MediaQuery.of(context).size.width * 0.04,
                  percent: percentage,
                  center: new Text(
                    "${(percentage * 100).roundToDouble()}%",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.1),
                  ),
                  circularStrokeCap: CircularStrokeCap.butt,
                  backgroundColor: Colors.red,
                  progressColor: Colors.green,
                ),
              ),
            );
          } else {
            return Center(child: Text('heeft nog geen data'));
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
