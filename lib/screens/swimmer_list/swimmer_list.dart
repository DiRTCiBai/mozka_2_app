import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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
  ListScreen listScreen = ListScreen.addlist;
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    PrecencesFunctions precencesFunctions =
        PrecencesFunctions(context: context);

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
              precencesFunctions.SettingModalBottomSheet();
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

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 22.0),
        children: GetSpeedDialList(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue,
        buttonBackgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.list, size: 30),
          Icon(Icons.check, size: 30),
          Icon(Icons.add, size: 30),
        ],
        onTap: (index) {
          if (index == 0) {
            setState(() {
              listScreen = ListScreen.addlist;
            });
          } else if (index == 1) {
            setState(() {
              listScreen = ListScreen.precenceslist;
            });
          } else if (index == 2) {
            Navigator.pushNamed(context, AddSwimmers.id);
          }
          _page = index;
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TopSheet(
              title: _page == 0 ? 'Zwemmer lijst' : 'Aanwezigheden',
            ),
            //ScrollList(swimmerDataList),
            Expanded(
                child: _page == 0 ? AddScrollList() : PrecencesScrollList()),
          ],
        ),
      ),
    );
  }
}

enum ListScreen { addlist, precenceslist }
