import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WerkpuntInfoCard extends StatelessWidget {
  SwimmerData2 swimmerData;

  String title = 'Werkpunten';

  WerkpuntInfoCard({this.swimmerData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: Text(
                  'Werkpunt 1',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: Text(
                  'Werkpunt 1',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: Text(
                  'Werkpunt 1',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
