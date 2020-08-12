import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/screens/add_swimmer_screen.dart';
import 'package:mozka_2_app/widgets/swimmer_list/streambuilder_listview.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';
import 'package:mozka_2_app/widgets/aanwezigheden/streambuilder_listview.dart';

class AanwezighedenScreen extends StatefulWidget {
  static const String id = 'aanwezigheden';

  @override
  _AanwezighedenScreenState createState() => _AanwezighedenScreenState();
}

class _AanwezighedenScreenState extends State<AanwezighedenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Expanded(child: StreamBuilderListViewAanwezigheden()),
              FlatButton(
                color: Colors.white,
                child: Text('done'),
                onPressed: () {
                  print('save en ga terug naar start scherm');
                },
              ),
              FlatButton(
                color: Colors.white,
                child: Text('cancel'),
                onPressed: () {
                  print('ga terug naar start scherm');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
