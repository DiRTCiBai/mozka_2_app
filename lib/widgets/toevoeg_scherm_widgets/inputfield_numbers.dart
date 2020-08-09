import 'package:flutter/material.dart';

class InputFieldNumbers extends StatelessWidget {
  final String hintText;
  final Function onChanged;

  InputFieldNumbers({this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.numberWithOptions(),
        onChanged: onChanged,
      ),
    );
  }
}
