import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';

class GroupInfoCard extends StatelessWidget {
  SwimmerData2 swimmerData;

  GroupInfoCard({this.swimmerData});
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
                  'Groep: ${swimmerData.groep.toUpperCase()}',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: Text('begin datum groep'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 5),
                child: Text('Groep'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
