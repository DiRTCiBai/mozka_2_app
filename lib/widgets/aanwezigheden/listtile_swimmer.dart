import 'package:flutter/material.dart';
import 'package:mozka_2_app/constants.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';

class ListTileSwimmer extends StatelessWidget {
  final SwimmerData swimmerData;
  final Function onTap;
  final bool aanwezig;

  ListTileSwimmer({this.onTap, this.swimmerData, this.aanwezig});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: aanwezig ? Colors.lightGreenAccent : Colors.white,
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor:
                swimmerData.geslacht == 'man' ? kmanColor : kfemakeColor,
            child: Text(
              '${swimmerData.voornaam[0].toUpperCase()}${swimmerData.achernaam[0].toUpperCase()}',
              style: TextStyle(color: kcircleAvatarTextColor),
            ),
          ),
          title: Text(
            '${swimmerData.voornaam} ${swimmerData.achernaam}',
            style: TextStyle(fontSize: 25.0),
          ),
          trailing: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}