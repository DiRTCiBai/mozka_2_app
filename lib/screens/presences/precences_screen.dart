import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/presences/precences_widget.dart';
import 'package:mozka_2_app/screens/presences/precences_function.dart';

class PrecencesScreen extends StatefulWidget {
  static const String id = 'aanwezigheden';

  @override
  _PrecencesScreenState createState() => _PrecencesScreenState();
}

class _PrecencesScreenState extends State<PrecencesScreen> {
  int swimmerListLength = 0;
  PrecencesFunctions precencesFunctions = PrecencesFunctions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
          precencesFunctions.SettingModalBottomSheet(context);
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TopSheet(),
            //ScrollList(swimmerDataList),
            Expanded(child: ScrollList()),
          ],
        ),
      ),
    );
  }
}
