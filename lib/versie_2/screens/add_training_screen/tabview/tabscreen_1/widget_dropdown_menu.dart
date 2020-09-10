import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/add_training_screen/constants.dart';

class DropDown extends StatelessWidget {
  final Function onChanged;
  final String dropdownValue;
  final List<String> items;

  DropDown({this.onChanged, this.dropdownValue, this.items});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black, fontSize: 20),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
