import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/functions/speed_dial_list.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/widgets/bottom_nav_bar.dart';

class HomeScreenMain extends StatefulWidget {
  static const String id = 'HomeScreenMain';

  @override
  _HomeScreenMainState createState() => _HomeScreenMainState();
}

class _HomeScreenMainState extends State<HomeScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
//            _auth.signOut();
//            Navigator.popUntil(context, ModalRoute.withName(StartScreenV2.id));
          },
        ),
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
