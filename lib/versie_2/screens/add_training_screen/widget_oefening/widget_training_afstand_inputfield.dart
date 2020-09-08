import 'package:flutter/material.dart';
import 'constants.dart';

class TrainingAfstandInputField extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final Function onTap;
  final bool saved;

  TrainingAfstandInputField(
      {this.hintText, this.onChanged, this.onTap, this.saved});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        style: !saved ? ktextStyleSaved : ktextStyleUnSaved,
        onChanged: onChanged,
        onTap: onTap,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 0, bottom: 0),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
