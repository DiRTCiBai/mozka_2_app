import 'package:flutter/material.dart';

class CustomEmailField extends StatelessWidget {
  final Function onChanged;

  CustomEmailField({this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      width: 350,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: 'test@email.com',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
