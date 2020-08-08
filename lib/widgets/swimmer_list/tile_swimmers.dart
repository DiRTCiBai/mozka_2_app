import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/gender.dart';
import 'package:mozka_2_app/constants.dart';
import 'package:mozka_2_app/modules/data_swimmers.dart';

class SwimmerTile extends StatelessWidget {
  final Swimmers swimmer;
  final Function onTap;

  SwimmerTile({this.onTap, this.swimmer});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor:
                swimmer.geslacht == Gender.man ? kmanColor : kfemakeColor,
            child: Text(
              '${swimmer.voornaam[0].toUpperCase()}${swimmer.achernaam[0].toUpperCase()}',
              style: TextStyle(color: kcircleAvatarTextColor),
            ),
          ),
          title: Text(
            '${swimmer.voornaam} ${swimmer.achernaam}',
            style: TextStyle(fontSize: 25.0),
          ),
          trailing: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
