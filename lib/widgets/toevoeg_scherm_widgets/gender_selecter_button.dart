import 'package:flutter/material.dart';

class GenderSelecterCard extends StatelessWidget {
  final Function onTap;
  final String displayText;
  final Color color;

  GenderSelecterCard({this.displayText, this.color = Colors.white, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: color,
          child: Container(
              height: 50.0,
              child: Center(
                  child: Text(
                displayText,
                style: TextStyle(fontSize: 20.0),
              ))),
        ),
      ),
    );
  }
}
