import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_comments_screen/main/list_of_comments_screen_main.dart';
import 'package:mozka_2_app/root/constants.dart';
import 'package:mozka_2_app/versie_2/screens/personal_precences_detail/main_personal_precences_detail.dart';
import 'package:mozka_2_app/versie_2/screens/edit_swimmer_data_screen/main/edit_swimmer_data_screen_main.dart';

class CustomDrawer extends StatelessWidget {
  final SwimmerData2 swimmerData;

  CustomDrawer({this.swimmerData});

  double iconSize = 25;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor:
                      swimmerData.geslacht == 'man' ? kmanColor : kfemakeColor,
                  child: Text(
                    '${swimmerData.voornaam[0].toUpperCase()}${swimmerData.achternaam[0].toUpperCase()}',
                    style:
                        TextStyle(color: kcircleAvatarTextColor, fontSize: 50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    '${swimmerData.voornaam} ${swimmerData.achternaam}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.message,
              color: Colors.blueGrey,
              size: iconSize,
            ),
            title: Text(
              'Opmerkingen',
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListOfCommentsMain(
                            swimmerData: swimmerData,
                          )));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.check_box,
              color: Colors.blueGrey,
              size: iconSize,
            ),
            title: Text(
              'Aanwezigheden',
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonalPrecencesDetail(
                            swimmerData: swimmerData,
                          )));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.show_chart,
              color: Colors.blueGrey,
              size: iconSize,
            ),
            title: Text(
              'Vooruitgang',
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(
              Icons.work,
              color: Colors.blueGrey,
              size: iconSize,
            ),
            title: Text(
              'Werkpunten',
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(
              Icons.edit,
              color: Colors.blueGrey,
              size: iconSize,
            ),
            title: Text(
              'Bewerken',
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditSwimmerDataScreenMain(
                    swimmerData: swimmerData,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
