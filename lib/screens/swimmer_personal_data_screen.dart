import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/screens/edit_swimmer_screen.dart';
import 'package:mozka_2_app/widgets/toevoeg_scherm_widgets/add_screen_button.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/root/constants.dart';

class SwimmerPersonalDataScreen extends StatefulWidget {
  static const id = 'SwimmerPersonalData';
  final SwimmerData swimmerData;

  SwimmerPersonalDataScreen({this.swimmerData});

  @override
  _SwimmerPersonalDataScreenState createState() =>
      _SwimmerPersonalDataScreenState();
}

class _SwimmerPersonalDataScreenState extends State<SwimmerPersonalDataScreen> {
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
              widget.swimmerData.voornaam,
              style: kstyle,
            ),
            Text(
              widget.swimmerData.achternaam,
              style: kstyle,
            ),
            Text(
              widget.swimmerData.geboortejaar.toString(),
              style: kstyle,
            ),
            Text(
              widget.swimmerData.geslacht,
              style: kstyle,
            ),
            Text(
              widget.swimmerData.email,
              style: kstyle,
            ),
            AddScreenButton(
              text: 'Back',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            AddScreenButton(
              text: 'Update',
              onPressed: () async {
                var refresh = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => EditSwimmers(
                              swimmerData: widget.swimmerData,
                            )));
                setState(() {
                  refresh;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
