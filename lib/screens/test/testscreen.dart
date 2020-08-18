import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/modules/firebase/firebase_interface.dart';

import 'package:mozka_2_app/functions/precences_list/precences_funtions.dart';

class Test extends StatefulWidget {
  static const String id = 'test';

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  PrecencesFunctions precencesFunctions = PrecencesFunctions();
  FireBaseInterface fireBaseInterface = FireBaseInterface();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var now = new DateTime.now();
          //print(now.year);

          String date =
              now.day.toString() + now.month.toString() + now.year.toString();
          print(date);
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[],
        ),
      ),
    );
  }
}

enum ListScreen { addlist, precenceslist }
