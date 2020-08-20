import 'package:flutter/material.dart';

class GroupInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Groep'),
              Text('begin datum groep'),
              Text('Groep'),
            ],
          ),
        ),
      ),
    );
  }
}
