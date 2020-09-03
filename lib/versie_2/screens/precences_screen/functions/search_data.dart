import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/root/constants.dart';
import 'package:provider/provider.dart';

class SearchPrecencesList extends SearchDelegate<SwimmerData2> {
  final List<SwimmerData2> list;

  SearchPrecencesList({this.list});

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
    final newlist = list.where((p) => p.voornaam.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            //showResults(context);
            print(swimmerlist[index]);
            swimmerlist[index].aanwezig = !swimmerlist[index].aanwezig;
          },
          leading: CircleAvatar(
            backgroundColor:
                swimmerlist[index].geslacht == 'man' ? kmanColor : kfemakeColor,
            child: Text(
              '${swimmerlist[index].voornaam[0].toUpperCase()}${swimmerlist[index].achternaam[0].toUpperCase()}',
              style: TextStyle(color: kcircleAvatarTextColor),
            ),
          ),
          title: Text(
              '${swimmerlist[index].voornaam} ${swimmerlist[index].achternaam}'),
        );
      },
      itemCount: swimmerlist.length,
    );
  }
}
