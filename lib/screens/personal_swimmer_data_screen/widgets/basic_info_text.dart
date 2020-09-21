import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/constants.dart';

class BasicInfoText extends StatelessWidget {
  final String text;
  final IconData icon;

  BasicInfoText({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 3, bottom: 3),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black45,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: kstyle,
          ),
        ],
      ),
    );
  }
}
