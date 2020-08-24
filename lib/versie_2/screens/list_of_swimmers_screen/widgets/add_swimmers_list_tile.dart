import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/root/constants.dart';

class ListTileSwimmer extends StatelessWidget {
  final SwimmerData2 swimmerData;
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
