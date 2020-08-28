import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/main/home_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';

class TrainingScreenMain extends StatefulWidget {
  static const String id = 'TrainingScreenMain';
  @override
  _TrainingScreenMainState createState() => _TrainingScreenMainState();
}

class _TrainingScreenMainState extends State<TrainingScreenMain> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('komt binnen kort'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Zwemmers'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            title: Text('Training'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
