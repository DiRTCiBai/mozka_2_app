import 'package:flutter/material.dart';

class CustomPrecencesDetailTitle extends StatelessWidget {
  final String title;

  CustomPrecencesDetailTitle({this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
      ),
    );
  }
}
