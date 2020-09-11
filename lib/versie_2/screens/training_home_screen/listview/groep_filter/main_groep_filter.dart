import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/training_home_screen/listview/groep_filter/function_filter_groep_list.dart';
import 'filter_button.dart';
import 'package:mozka_2_app/versie_2/modules/filter_database.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/constants/constants.dart';

class MainGroepFilter extends StatefulWidget {
  @override
  _MainGroepFilterState createState() => _MainGroepFilterState();
}

class _MainGroepFilterState extends State<MainGroepFilter> {
  @override
  Widget build(BuildContext context) {
    String groep = Provider.of<FilterDatabase>(context).GetFilter();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FilterlButton(
            onTap: () {
              Provider.of<FilterDatabase>(context, listen: false)
                  .SetFilter(kGroepPre);
              setState(() {
                groep = kGroepPre;
              });
            },
            selected: groep == kGroepPre ? true : false,
            text: kTextPre,
          ),
          FilterlButton(
            onTap: () {
              Provider.of<FilterDatabase>(context, listen: false)
                  .SetFilter(kGroepF);
              setState(() {
                groep = kGroepF;
              });
            },
            selected: groep == kGroepF ? true : false,
            text: kGroepF.toUpperCase(),
          ),
          FilterlButton(
            onTap: () {
              Provider.of<FilterDatabase>(context, listen: false)
                  .SetFilter(kGroepE);
              setState(() {
                groep = kGroepE;
              });
            },
            selected: groep == kGroepE ? true : false,
            text: kGroepE.toUpperCase(),
          ),
          FilterlButton(
            onTap: () {
              Provider.of<FilterDatabase>(context, listen: false)
                  .SetFilter(kGroepD);
              setState(() {
                groep = kGroepD;
              });
            },
            selected: groep == kGroepD ? true : false,
            text: kGroepD.toUpperCase(),
          ),
          FilterlButton(
            onTap: () {
              Provider.of<FilterDatabase>(context, listen: false)
                  .SetFilter(kGroepC);
              setState(() {
                groep = kGroepC;
              });
            },
            selected: groep == kGroepC ? true : false,
            text: kGroepC.toUpperCase(),
          ),
          FilterlButton(
            onTap: () {
              Provider.of<FilterDatabase>(context, listen: false)
                  .SetFilter(kGroepB);
              setState(() {
                groep = kGroepB;
              });
            },
            selected: groep == kGroepB ? true : false,
            text: kGroepB.toUpperCase(),
          ),
          FilterlButton(
            onTap: () {
              Provider.of<FilterDatabase>(context, listen: false)
                  .SetFilter(kGroepA);
              setState(() {
                groep = kGroepA;
              });
            },
            selected: groep == kGroepA ? true : false,
            text: kGroepA.toUpperCase(),
          ),
        ],
      ),
    );
  }
}
