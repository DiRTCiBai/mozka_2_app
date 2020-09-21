import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onTap;

  Button({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          color: Colors.blue,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
        ),
      ),
    );
  }
}
