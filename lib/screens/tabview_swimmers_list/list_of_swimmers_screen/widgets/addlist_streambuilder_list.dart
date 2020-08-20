import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/add_swimmer_screen/main/main_add_swimmer_screen.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_swimmers_screen/widgets/addlist_listview_builder.dart';

class AddScrollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          Expanded(child: StreamListView()),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MainAddSwimmerScreen.id);
                  },
                  child: Card(
                    color: Colors.blue,
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
