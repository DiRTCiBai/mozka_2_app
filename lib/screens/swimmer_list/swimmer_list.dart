import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mozka_2_app/screens/add_swimmer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';
import 'package:mozka_2_app/widgets/lists/addlist_list/addlist_streambuilder_list.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/lists/topsheet.dart';
import 'package:mozka_2_app/widgets/lists/precences_list/precences_streambuilder_list.dart';
import 'package:mozka_2_app/functions/precences_list/precences_funtions.dart';

class SpeedDialList extends StatefulWidget {
  static const String id = 'SwimmersList';

  @override
  _SpeedDialListState createState() => _SpeedDialListState();
}

class _SpeedDialListState extends State<SpeedDialList> {
  PrecencesFunctions precencesFunctions = PrecencesFunctions();
  ListScreen listScreen = ListScreen.addlist;
  FireBaseInterface fireBaseInterface = FireBaseInterface();

  List<SpeedDialChild> GetSpeedDialList() {
    if (listScreen == ListScreen.addlist) {
      List<SpeedDialChild> speeddiallist = [
        SpeedDialChild(
          child: Icon(Icons.list, color: Colors.white),
          backgroundColor: Colors.greenAccent,
          onTap: () {
            setState(() {
              listScreen = ListScreen.addlist;
            });
          },
          label: 'Zwemmers lijst',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.greenAccent,
        ),
        SpeedDialChild(
          child: Icon(Icons.check, color: Colors.white),
          backgroundColor: Colors.yellowAccent,
          onTap: () {
            setState(() {
              listScreen = ListScreen.precenceslist;
            });
          },
          label: 'Aanwezigheden',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.yellowAccent,
        ),
        SpeedDialChild(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.indigoAccent,
          onTap: () {
            Navigator.pushNamed(context, AddSwimmers.id);
          },
          label: 'Zwemmer toevoegen',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.indigoAccent,
        ),
      ];
      return speeddiallist;
    } else {
      List<SpeedDialChild> speeddiallist = [
        SpeedDialChild(
          child: Icon(Icons.save, color: Colors.white),
          backgroundColor: Colors.greenAccent,
          onTap: () {
            precencesFunctions.SettingModalBottomSheet(context);
          },
          label: 'Save',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.greenAccent,
        ),
        SpeedDialChild(
          child: Icon(Icons.list, color: Colors.white),
          backgroundColor: Colors.indigoAccent,
          onTap: () {
            setState(() {
              listScreen = ListScreen.addlist;
            });
          },
          label: 'Zwemmers lijst',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.indigoAccent,
        ),
      ];
      return speeddiallist;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        children: GetSpeedDialList(),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TopSheet(
              title: listScreen == ListScreen.addlist
                  ? 'Zwemmer lijst'
                  : 'Aanwezigheden',
            ),
            //ScrollList(swimmerDataList),
            Expanded(
                child: listScreen == ListScreen.addlist
                    ? AddScrollList()
                    : PrecencesScrollList()),
          ],
        ),
      ),
    );
  }
}

enum ListScreen { addlist, precenceslist }
