import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/constants/constants.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/main/home_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/training_screen/main/training_screen_main.dart';

class CustomBottomNavigatorBar extends StatefulWidget {
  @override
  _CustomBottomNavigatorBarState createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });

      if (index == 0) {
        Navigator.popUntil(context, ModalRoute.withName(HomeScreenMain.id));
      }
      if (index == 1) {
        Navigator.popUntil(context, ModalRoute.withName(HomeScreenMain.id));
        Navigator.pushNamed(context, ListOfSwimmersScreenMain.id);
      }
      if (index == 2) {
        Navigator.popUntil(context, ModalRoute.withName(HomeScreenMain.id));
        Navigator.pushNamed(context, TrainingScreenMain.id);
      }
    }

    return BottomNavigationBar(
      items: kBottomNav,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
