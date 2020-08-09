import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/data_swimmers.dart';
import 'package:mozka_2_app/widgets/add_screen/add_screen_button.dart';
import 'package:mozka_2_app/constants.dart';

class SwimmerData extends StatelessWidget {
  static const id = 'SwimmerData';
  final Swimmers swimmer;

  SwimmerData({this.swimmer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              child: Icon(
                Icons.account_circle,
                size: 80.0,
              ),
            ),
            Text(
              swimmer.voornaam,
              style: kstyle,
            ),
            Text(
              swimmer.achernaam,
              style: kstyle,
            ),
            Text(
              swimmer.geboortejaar.toString(),
              style: kstyle,
            ),
            Text(
              swimmer.geslacht,
              style: kstyle,
            ),
            Text(
              swimmer.email,
              style: kstyle,
            ),
            AddScreenButton(
              text: 'Back',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
