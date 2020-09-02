import 'package:flutter/material.dart';

class SearchBarTest extends StatelessWidget {
  static const String id = 'SearchBarTest';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search bar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchData(
                  list: ['sam', 'maarten', 'silke', 'sjobbe', 'lieze'],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SearchData extends SearchDelegate<String> {
  final List<String> list;
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
    final newlist = query.isEmpty
        ? recentlist
        : list.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            showResults(context);
            print(newlist[index]);
          },
          title: Text(newlist[index]),
        );
      },
      itemCount: newlist.length,
    );
  }
}
