import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  final Function onChanged;

  CustomPasswordField({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      width: 350,
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: 'wachtwoord',
        ),
        onChanged: onChanged,
      ),
    );
  }
}
