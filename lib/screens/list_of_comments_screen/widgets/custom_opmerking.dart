import 'package:flutter/material.dart';

class CustomOpmerking extends StatelessWidget {
  final String title;
  final String trainer;
  final String datum;
  final String opmerking;
  final String detail;

  CustomOpmerking(
      {this.trainer, this.title, this.datum, this.opmerking, this.detail});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(trainer),
                Text(datum),
              ],
            ),
            subtitle: Text(detail),
          ),
          Divider(),
          ListTile(title: Text(opmerking)),
        ],
      ),
    );
  }
}
