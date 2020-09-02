import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/main/personal_swimmer_data_screen_main.dart';

class SearchSwimmerList extends SearchDelegate<SwimmerData2> {
  final List<SwimmerData2> list;

  SearchSwimmerList({this.list});

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PersonalSwimmerDataSCreenMain(
                  swimmerData: swimmerlist[index],
                ),
              ),
            );
          },
          title: Text(swimmerlist[index].voornaam),
        );
      },
      itemCount: swimmerlist.length,
    );
  }
}
