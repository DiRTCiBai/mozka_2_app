import 'package:flutter/material.dart';
import 'constants.dart';

class DropDown extends StatelessWidget {
  final Function onChanged;
  final String dropdownValue;

  DropDown({this.onChanged, this.dropdownValue});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black, fontSize: 20),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: onChanged,
      items: kdropDownMenu.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
