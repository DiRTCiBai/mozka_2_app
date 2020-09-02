import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/main/home_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/main/list_of_swimmers_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/precences_list_tile.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/versie_2/modules/time.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/functions/save_precences.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/functions/save_precences.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/save_button.dart';

class PrecencesScreenMain extends StatefulWidget {
  static const String id = 'PrecencesScreenMain';

  @override
  _PrecencesScreenMainState createState() => _PrecencesScreenMainState();
}

class _PrecencesScreenMainState extends State<PrecencesScreenMain> {
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
    List<SwimmerData2> swimmerlist = Provider.of<List<SwimmerData2>>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Aanwezigheden'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchData(
                  list: swimmerlist,
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTileSwimmer(
                    swimmerData: swimmerlist[index],
                    aanwezig: swimmerlist[index].aanwezig,
                    onTap: () {
                      setState(() {
                        swimmerlist[index].aanwezig =
                            !swimmerlist[index].aanwezig;
                      });
                    },
                  );
                },
                itemCount: swimmerlist.length),
          ),
          PrecencesSaveButton(swimmerlist: swimmerlist),
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

class SearchData extends SearchDelegate<SwimmerData2> {
  final List<SwimmerData2> list;
  final recentlist = ['sam', 'maarten'];

  SearchData({this.list});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_circle),
      title: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<SwimmerData2> swimmerlist = Provider.of<List<SwimmerData2>>(context)
        .where((p) => p.voornaam.startsWith(query))
        .toList();
    final newlist =
//    query.isEmpty
//        ? recentlist
//        :
        list.where((p) => p.voornaam.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            //showResults(context);
            print(swimmerlist[index]);
            swimmerlist[index].aanwezig = !swimmerlist[index].aanwezig;
          },
          title: Text(swimmerlist[index].voornaam),
        );
      },
      itemCount: swimmerlist.length,
    );
  }
}
