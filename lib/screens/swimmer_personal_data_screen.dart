import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/widgets/toevoeg_scherm_widgets/add_screen_button.dart';
import 'package:mozka_2_app/constants.dart';

class SwimmerPersonalDataScreen extends StatelessWidget {
  static const id = 'SwimmerData';
  final SwimmerData swimmerData;

  SwimmerPersonalDataScreen({this.swimmerData});

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
              swimmerData.voornaam,
              style: kstyle,
            ),
            Text(
              swimmerData.achernaam,
              style: kstyle,
            ),
            Text(
              swimmerData.geboortejaar.toString(),
              style: kstyle,
            ),
            Text(
              swimmerData.geslacht,
              style: kstyle,
            ),
            Text(
              swimmerData.email,
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
