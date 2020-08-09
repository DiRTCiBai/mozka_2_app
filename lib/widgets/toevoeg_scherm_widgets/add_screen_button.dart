import 'package:flutter/material.dart';
import 'package:mozka_2_app/constants.dart';
import 'package:mozka_2_app/constants.dart';

class AddScreenButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  AddScreenButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: kbuttonColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              new BoxShadow(
                color: kshadowColor,
                offset: new Offset(3.0, 3.0),
              )
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 20.0,
                  color: ktextColor,
                  fontWeight: FontWeight.w600),
            ),
          )),
      onTap: onPressed,
    );
  }
}
