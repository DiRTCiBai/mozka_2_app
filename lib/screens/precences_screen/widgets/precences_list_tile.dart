import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/constants.dart';

class ListTileSwimmer extends StatelessWidget {
  final SwimmerData2 swimmerData;
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
              '${swimmerData.voornaam[0].toUpperCase()}${swimmerData.achternaam[0].toUpperCase()}',
              style: TextStyle(color: kcircleAvatarTextColor),
            ),
          ),
          title: Text(
            '${swimmerData.voornaam} ${swimmerData.achternaam}',
            style: TextStyle(fontSize: 25.0),
          ),
          trailing: Text(swimmerData.groep.toUpperCase()),
        ),
      ),
    );
  }
}
