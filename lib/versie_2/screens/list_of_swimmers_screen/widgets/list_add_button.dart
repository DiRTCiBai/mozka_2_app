import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/add_swimmer_screen/main/add_swimmer_screen_main.dart';

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
