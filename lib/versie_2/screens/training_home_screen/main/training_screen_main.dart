import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/add_training_screen/add_training_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/main/home_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/training_home_screen/listview/main_listview.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: TrainingenListview()),
            SaveButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddTrainingScreenMain()),
                );
              },
              text: 'maak training',
            ),
          ],
        ),
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

class SaveButton extends StatelessWidget {
  final String text;
  final Function onTap;

  SaveButton({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
        ),
      ),
    );
  }
}
