import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/add_swimmer_screen.dart';
import 'package:mozka_2_app/widgets/swimmer_list/streambuilder_listview.dart';

class SwimmersList extends StatefulWidget {
  static const String id = 'SwimmersList';

  @override
  _SwimmersListState createState() => _SwimmersListState();
}

class _SwimmersListState extends State<SwimmersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final refresh = await Navigator.pushNamed(context, AddSwimmers.id);
          setState(() {
            refresh;
          });
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: StreamBuilderListView(),
        ),
      ),
    );
  }
}
