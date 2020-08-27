import 'package:flutter/material.dart';
import 'package:mozka_2_app/root/constants.dart';

class BasicInfoText extends StatelessWidget {
  final String text;
  final IconData icon;

  BasicInfoText({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
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
