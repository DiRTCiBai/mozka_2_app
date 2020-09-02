import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/training_screen/main/training_screen_main.dart';
import 'package:mozka_2_app/versie_2/constants/constants.dart';

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
          Navigator.pushNamed(context, ListOfSwimmersScreenMain.id);
          _selectedIndex = 0;
        }
        if (index == 2) {
          Navigator.pushNamed(context, TrainingScreenMain.id);
          _selectedIndex = 0;
        }
      });
    }

    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(kBottomNavIcon1),
          title: Text(kBottomNavText1),
        ),
        BottomNavigationBarItem(
          icon: Icon(kBottomNavIcon2),
          title: Text(kBottomNavText2),
        ),
        BottomNavigationBarItem(
          icon: Icon(kBottomNavIcon3),
          title: Text(kBottomNavText3),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
