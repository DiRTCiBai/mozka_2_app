import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/add_training_screen/constants.dart';
import 'package:mozka_2_app/versie_2/screens/add_training_screen/tabview/function_training_save_data.dart';
import 'widget_dropdown_menu.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/screens/add_training_screen/tabview/widget_button.dart';

const kdropDownList2 = ['E1', 'E2', 'E3', 'S1', 'S2', 'S3'];
const kpadding = 20.0;
const kbuttonColor = Colors.blue;

class TabBarScreen1 extends StatefulWidget {
  @override
  _TabBarScreen1State createState() => _TabBarScreen1State();
}

class _TabBarScreen1State extends State<TabBarScreen1> {
  String dropdownValue1 = kdropDownMenu[0];
  String dropdownValue2 = kdropDownList2[0];

  @override
  Widget build(BuildContext context) {
    String _datum = Provider.of<TrainingSaveData>(context).GetDatum();

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(kpadding),
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              color: kbuttonColor,
            ),
            child: Center(
              child: DropDown(
                dropdownValue: dropdownValue1,
                items: kdropDownMenu,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue1 = newValue;
                    Provider.of<TrainingSaveData>(context, listen: false)
                        .SetSlag(newValue);
                  });
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(kpadding),
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              color: kbuttonColor,
            ),
            child: Center(
              child: DropDown(
                dropdownValue: dropdownValue2,
                items: kdropDownList2,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue2 = newValue;
                    Provider.of<TrainingSaveData>(context, listen: false)
                        .SetType(newValue);
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kpadding),
            child: Button(
              color: kbuttonColor,
              text: _datum == null
                  ? 'Seleteer datum'
                  : _datum.replaceRange(10, 23, ''),
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2222))
                    .then((date) {
                  print(date);
                  if (date == null) {
                    print(date);
                    _datum = null;
                  } else {
                    setState(() {
                      Provider.of<TrainingSaveData>(context, listen: false)
                          .SetDatum(date.toString());
                    });
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
