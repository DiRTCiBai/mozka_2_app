import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final Function onSaved;
  final String hintText;
  final int maxLines;

  CustomFormField({this.onSaved, this.hintText, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 375,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          maxLines: maxLines,
          onSaved: onSaved,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ),
    );
  }
}
