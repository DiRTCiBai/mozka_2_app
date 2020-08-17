import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/add_swimmer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';
import 'package:mozka_2_app/widgets/lists/addlist_list/addlist_streambuilder_list.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/lists/topsheet.dart';

class SwimmersList extends StatefulWidget {
  static const String id = 'SwimmersList';

  @override
  _SwimmersListState createState() => _SwimmersListState();
}

class _SwimmersListState extends State<SwimmersList> {
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  List<PrecencesData> aawezighedenList = [];

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
            TopSheet(
              title: 'Zwemmer lijst',
            ),
            //ScrollList(swimmerDataList),
            Expanded(child: ScrollList()),
          ],
        ),
      ),
    );
  }
}