import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_comments_screen/widgets/get_comments.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/main/home_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/main/precences_screen_main.dart';

class ListOfCommentsMain extends StatefulWidget {
  static const String id = 'ListOfCommentsMain';

  SwimmerData2 swimmerData;

  ListOfCommentsMain({this.swimmerData});

  @override
  _ListOfCommentsMainState createState() => _ListOfCommentsMainState();
}

class _ListOfCommentsMainState extends State<ListOfCommentsMain> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0) {
        Navigator.popUntil(context, ModalRoute.withName(HomeScreenMain.id));
      }
      if (index == 2) {
        Navigator.popUntil(context, ModalRoute.withName(HomeScreenMain.id));
        Navigator.pushNamed(context, PrecencesScreenMain.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Opmerkingen'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetComments(
          swimmerData: widget.swimmerData,
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
            icon: Icon(Icons.check),
            title: Text('Aanwezigheden'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
