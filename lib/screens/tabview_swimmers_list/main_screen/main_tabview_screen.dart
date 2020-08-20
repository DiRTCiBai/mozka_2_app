import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_precences_screen/main/main_list_of_precences_screen.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_swimmers_screen/main/main_list_of_swimmers_screen.dart';

class TabViewScreen extends StatelessWidget {
  static const String id = 'TabViewScreen';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Zwemmers'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Lijst',
              ),
              Tab(
                text: 'Aanwezigheden',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            MainListOfSwimmersScreen(),
            MainListOfPrecencesScreen(),
          ],
        ),
      ),
    );
  }
}
