import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'widget_speed_dial_list.dart';
import 'widget_bottom_nav_bar.dart';
import 'package:mozka_2_app/screens/mozka_precences_screen/main.dart';

class HomeScreenMain extends StatefulWidget {
  static const String id = 'HomeScreenMain';

  @override
  _HomeScreenMainState createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  double iconSize = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('images/MozkaLogo.png'),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.check_box,
                color: Colors.blueGrey,
                size: iconSize,
              ),
              title: Text(
                'Aanwezigheden',
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {
                Navigator.pushNamed(context, MozkaPrecencesScreen.id);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
//        leading: IconButton(
//          icon: Icon(Icons.arrow_back),
//          onPressed: () {
////            _auth.signOut();
////            Navigator.popUntil(context, ModalRoute.withName(StartScreenV2.id));
//          },
//        ),
        title: Text('Home'),
      ),
      floatingActionButton: SpeedDial(
        closeManually: false,
        curve: Curves.bounceIn,
        overlayOpacity: 0.5,
        animatedIcon: AnimatedIcons.menu_close,
        children: GetList(context),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          Image(
            width: 300,
            image: AssetImage('images/MozkaLogo.png'),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
