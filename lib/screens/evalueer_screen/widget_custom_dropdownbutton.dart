import 'package:flutter/material.dart';

class CustomDropDownButton extends StatefulWidget {
  final List<String> itemList;
  String _selectedValue;

  CustomDropDownButton({this.itemList}) {
    _selectedValue = itemList[0];
  }

  @override
  _CustomDropDownButtonState createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        color: Colors.blue,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: Text(''),
          dropdownColor: Colors.blue,
          items: widget.itemList.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Container(
                width: 300,
                child: Center(
                  child: Text(
                    dropDownStringItem,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              widget._selectedValue = value;
            });
          },
          value: widget._selectedValue,
        ),
      ),
    );
  }
}
