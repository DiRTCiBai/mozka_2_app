import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/add_comments_screen/main/add_comments_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/widgets/add_swimmers_list_tile.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/functions/swimmer_list_stream.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/main/personal_swimmer_data_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/functions/delete_swimmer.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/widgets/list_add_button.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/main/home_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/main/precences_screen_main.dart';

class ListOfSwimmersScreenMain extends StatefulWidget {
  static const String id = 'ListOfSwimmersScreenMain';

  @override
  _ListOfSwimmersScreenMainState createState() =>
      _ListOfSwimmersScreenMainState();
}

class _ListOfSwimmersScreenMainState extends State<ListOfSwimmersScreenMain> {
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
      Navigator.pushNamed(context, PrecencesScreenMain.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('lijst'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
                stream: GetSwimmerData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTileSwimmer(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PersonalSwimmerDataSCreenMain(
                                    swimmerData: snapshot.data[index],
                                  ),
                                ),
                              );
                            },
                            onLongPress: () {
                              DeleteSwimmerFromFirestore(snapshot.data[index]);
                            },
                            onDoubleTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddCommentsScreenMain(
                                  swimmerData: snapshot.data[index],
                                ),
                              ),
                            ),
                            swimmerData: snapshot.data[index],
                          );
                        },
                        itemCount: snapshot.data.length);
                  } else {
                    return Text('loading');
                  }
                }),
          ),
          ListAddButton(),
        ],
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
