import 'package:flutter/material.dart';

class InputFieldText extends StatelessWidget {
  final String hintText;
  final Function onChanged;

  InputFieldText({this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
