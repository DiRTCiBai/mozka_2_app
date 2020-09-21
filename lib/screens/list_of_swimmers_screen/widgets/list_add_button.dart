import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/screens/add_swimmer_screen/main_add_swimmer_screen.dart';

class ListAddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: FlatButton(
        onPressed: () => Navigator.pushNamed(context, AddSwimmerScreenMain.id),
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
