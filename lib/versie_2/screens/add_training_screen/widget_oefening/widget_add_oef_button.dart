import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/oefeningen_database.dart';

class AddOefeningButton extends StatelessWidget {
  final OefeningenData oefeningenData;
  final bool isVisible;
  final Function onPressed;

  AddOefeningButton({this.oefeningenData, this.isVisible, this.onPressed});

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    isVisible ? visible = true : visible = false;

    return Visibility(
      visible: visible,
      child: IconButton(
        icon: Icon(Icons.add),
        onPressed: onPressed,
      ),
    );
  }
}
