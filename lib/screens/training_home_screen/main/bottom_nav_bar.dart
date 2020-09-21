import 'package:flutter/material.dart';
import 'package:mozka_2_app/constants/constants.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/screens/home_screen/main_home_screen.dart';
import 'package:mozka_2_app/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';

class CustomBottomNavigatorBar extends StatefulWidget {
  @override
  _CustomBottomNavigatorBarState createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;

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
    }

    return BottomNavigationBar(
      items: kBottomNav,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
