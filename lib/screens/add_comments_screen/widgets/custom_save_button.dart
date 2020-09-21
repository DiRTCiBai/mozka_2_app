import 'package:flutter/material.dart';

class CustomSaveButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
            child: Text(
          'Save',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }
}
