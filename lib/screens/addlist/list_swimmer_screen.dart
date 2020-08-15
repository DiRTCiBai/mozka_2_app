import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/add_swimmer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';
import 'package:mozka_2_app/screens/addlist/addlist_widgets.dart';

class SwimmersList extends StatefulWidget {
  static const String id = 'SwimmersList';

  @override
  _SwimmersListState createState() => _SwimmersListState();
}

class _SwimmersListState extends State<SwimmersList> {
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  List<Aanwezighedendata> aawezighedenList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AddSwimmers.id);
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
