import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/add_swimmer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/modules/firebase/firebase_interface.dart';
import 'package:mozka_2_app/widgets/lists/addlist_list/addlist_streambuilder_list.dart';
import 'package:mozka_2_app/widgets/lists/topsheet.dart';
import 'package:mozka_2_app/widgets/lists/precences_list/precences_streambuilder_list.dart';
import 'package:mozka_2_app/functions/precences_list/precences_funtions.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class SpeedDialList extends StatefulWidget {
  static const String id = 'SwimmersList';

  @override
  _SpeedDialListState createState() => _SpeedDialListState();
}

class _SpeedDialListState extends State<SpeedDialList> {
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    PrecencesFunctions precencesFunctions =
        PrecencesFunctions(context: context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue,
        buttonBackgroundColor: Colors.white,
        index: 1,
        items: <Widget>[
          Icon(Icons.arrow_back, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.check, size: 30),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
          setState(() {
            _page = index;
          });
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TopSheet(
              title: _page == 1 ? 'Zwemmer lijst' : 'Aanwezigheden',
            ),
            //ScrollList(swimmerDataList),
            Expanded(
                child: _page == 1 ? AddScrollList() : PrecencesScrollList()),
          ],
        ),
      ),
    );
  }
}
