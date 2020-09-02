import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mozka_2_app/versie_2/screens/add_comments_screen/main/add_comments_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/main/precences_screen_main.dart';

List<SpeedDialChild> GetList(BuildContext context) {
  return [
    SpeedDialChild(
      child: Icon(Icons.check),
      backgroundColor: Colors.red,
      label: 'Aanwezigheden',
      labelStyle: TextStyle(fontSize: 18.0),
      onTap: () => Navigator.pushNamed(context, PrecencesScreenMain.id),
    ),
    SpeedDialChild(
      child: Icon(Icons.message),
      backgroundColor: Colors.green,
      label: 'Opmerking',
      labelStyle: TextStyle(fontSize: 18.0),
      onTap: () => Navigator.pushNamed(context, AddCommentsScreenMain.id),
    ),
    SpeedDialChild(
      child: Icon(Icons.check_box),
      backgroundColor: Colors.deepPurpleAccent,
      label: 'Evalueer',
      labelStyle: TextStyle(fontSize: 18.0),
      onTap: () {},
    ),
  ];
}
