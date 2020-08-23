import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/add_swimmer_screen/main/add_swimmer_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';

class StartScreenV2 extends StatelessWidget {
  static const String id = 'StartScreenV2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text('Toevoegen'),
            onPressed: () =>
                Navigator.pushNamed(context, AddSwimmerScreenMain.id),
          ),
          FlatButton(
            child: Text('lijst'),
            onPressed: () =>
                Navigator.pushNamed(context, ListOfSwimmersScreenMain.id),
          )
        ],
      ),
    );
  }
}
