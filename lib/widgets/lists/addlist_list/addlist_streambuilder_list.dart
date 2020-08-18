import 'package:flutter/material.dart';
import 'package:mozka_2_app/root/constants.dart';
import 'package:mozka_2_app/screens/add_swimmer_screen.dart';
import 'package:mozka_2_app/widgets/lists/addlist_list/addlist_listview_builder.dart';

class AddScrollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      decoration: kstreamBuilderBoxDecoration,
      child: Container(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            Expanded(child: StreamListView()),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AddSwimmers.id);
                  },
                  child: Card(
                    color: Colors.white,
                    child: Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
