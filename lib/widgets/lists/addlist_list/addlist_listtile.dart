import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/root/constants.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';

class ListTileSwimmer extends StatelessWidget {
  final SwimmerData swimmerData;
  final Function onTap;
  final Function onLongPress;

  ListTileSwimmer({this.onTap, this.swimmerData, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onLongPress: onLongPress,
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor:
                swimmerData.geslacht == 'man' ? kmanColor : kfemakeColor,
            child: Text(
              '${swimmerData.voornaam[0].toUpperCase()}${swimmerData.achternaam[0].toUpperCase()}',
              style: TextStyle(color: kcircleAvatarTextColor),
            ),
          ),
          title: Text(
            '${swimmerData.voornaam} ${swimmerData.achternaam}',
            style: TextStyle(fontSize: 25.0),
          ),
          trailing: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
