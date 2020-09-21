import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/training_home_screen/main/training_screen_main.dart';
import 'package:mozka_2_app/constants/constants.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/screens/home_screen/main_home_screen.dart';

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
