import 'package:flutter/material.dart';

class InputFieldEmail extends StatelessWidget {
  final String hintText;
  final Function onChanged;

  InputFieldEmail({this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: onChanged,
      ),
    );
  }
}
