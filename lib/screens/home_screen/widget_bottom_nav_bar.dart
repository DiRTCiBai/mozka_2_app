import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';
import 'package:mozka_2_app/screens/training_home_screen/main/training_screen_main.dart';
import 'package:mozka_2_app/constants/constants.dart';

class CustomBottomNavigatorBar extends StatefulWidget {
  @override
  _CustomBottomNavigatorBarState createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;

        if (index == 1) {
          //ga naar zwemmerlijst scherm
          Navigator.pushNamed(context, ListOfSwimmersScreenMain.id);
          _selectedIndex = 0;
        }
        if (index == 2) {
          //ga naar training scherm
          Navigator.pushNamed(context, TrainingScreenMain.id);
          _selectedIndex = 0;
        }
      });
    }

    return BottomNavigationBar(
      items: kBottomNav,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
