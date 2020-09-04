import 'package:flutter/material.dart';

class FilterlButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool selected;

  FilterlButton(
      {@required this.text, @required this.onTap, @required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          color: selected ? Colors.blue : Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15, color: selected ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
