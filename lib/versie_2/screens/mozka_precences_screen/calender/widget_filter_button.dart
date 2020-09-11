import 'package:flutter/material.dart';
import 'widget_groep_button.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/modules/filter_database.dart';

class GroepFilter extends StatefulWidget {
  @override
  _GroepFilterState createState() => _GroepFilterState();
}

class _GroepFilterState extends State<GroepFilter> {
  String groep = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FilterlButton(
          onTap: () {
            setState(() {
              Provider.of<FilterDatabase>(context, listen: false)
                  .SetFilter('pre');
              groep = 'p';
            });
          },
          selected: groep == 'p' ? true : false,
          text: 'P',
        ),
        FilterlButton(
          onTap: () {
            Provider.of<FilterDatabase>(context, listen: false).SetFilter('f');
            setState(() {
              groep = 'f';
            });
          },
          selected: groep == 'f' ? true : false,
          text: 'F',
        ),
        FilterlButton(
          onTap: () {
            Provider.of<FilterDatabase>(context, listen: false).SetFilter('e');
            setState(() {
              groep = 'e';
            });
          },
          selected: groep == 'e' ? true : false,
          text: 'E',
        ),
        FilterlButton(
          onTap: () {
            Provider.of<FilterDatabase>(context, listen: false).SetFilter('d');
            setState(() {
              groep = 'd';
            });
          },
          selected: groep == 'd' ? true : false,
          text: 'D',
        ),
        FilterlButton(
          onTap: () {
            Provider.of<FilterDatabase>(context, listen: false).SetFilter('c');
            setState(() {
              groep = 'c';
            });
          },
          selected: groep == 'c' ? true : false,
          text: 'C',
        ),
        FilterlButton(
          onTap: () {
            setState(() {
              Provider.of<FilterDatabase>(context, listen: false)
                  .SetFilter('b');
              groep = 'b';
            });
          },
          selected: groep == 'b' ? true : false,
          text: 'B',
        ),
        FilterlButton(
          onTap: () {
            Provider.of<FilterDatabase>(context, listen: false).SetFilter('a');
            setState(() {
              groep = 'a';
            });
          },
          selected: groep == 'a' ? true : false,
          text: 'A',
        ),
      ],
    );
  }
}
