import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_precences_screen/main/main_list_of_precences_screen.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_swimmers_screen/main/main_list_of_swimmers_screen.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/main_screen/main_tabview_screen.dart';
import 'package:mozka_2_app/screens/test/testscreen.dart';

class StartScreen extends StatefulWidget {
  static const String id = 'StartScreen';

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text("Add"),
            icon: Icon(Icons.add_box),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      appBar: AppBar(
        title: Text('Start'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardButton(
                  buttonText: 'lijst',
                  icon: Icons.list,
                  color: Colors.purple,
                  onTap: () {
                    Navigator.pushNamed(context, TabViewScreen.id);
                  },
                ),
                CardButton(
                  buttonText: 'MainListOfPrecencesScreen',
                  icon: Icons.check_box,
                  color: Colors.greenAccent,
                  onTap: () {
                    Navigator.pushNamed(context, MainListOfPrecencesScreen.id);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardButton(
                  buttonText: 'MainListOfSwimmersScreen',
                  icon: Icons.close,
                  color: Colors.cyanAccent,
                  onTap: () {
                    Navigator.pushNamed(context, MainListOfSwimmersScreen.id);
                  },
                ),
                CardButton(
                  buttonText: 'test',
                  icon: Icons.close,
                  color: Colors.limeAccent,
                  onTap: () {
                    Navigator.pushNamed(context, TestDonutPie.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final Function onTap;
  final Color color;

  CardButton({this.buttonText, this.icon, this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 180.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.black26,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 25.0,
                backgroundColor: color,
                child: Icon(
                  icon,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                buttonText,
                style: TextStyle(
                  fontSize: 20.0,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
