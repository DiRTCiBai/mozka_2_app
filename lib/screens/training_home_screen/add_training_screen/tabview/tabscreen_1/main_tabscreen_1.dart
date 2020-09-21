import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:mozka_2_app/screens/training_home_screen/add_training_screen/tabview/function_training_save_data.dart';
import 'widget_dropdown_menu.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/screens/training_home_screen/add_training_screen/tabview/widget_button.dart';

class TabBarScreen1 extends StatefulWidget {
  @override
  _TabBarScreen1State createState() => _TabBarScreen1State();
}

class _TabBarScreen1State extends State<TabBarScreen1> {
  String slag = kdropDownMenu.last;
  String type = kdropDownList2.last;
  String groep = kGroepDropDownMenu.last;

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
                dropdownValue: slag,
                items: kdropDownMenu,
                onChanged: (String newValue) {
                  setState(() {
                    slag = newValue;
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
                dropdownValue: type,
                items: kdropDownList2,
                onChanged: (String newValue) {
                  setState(() {
                    type = newValue;
                    Provider.of<TrainingSaveData>(context, listen: false)
                        .SetType(newValue);
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
                dropdownValue: groep,
                items: kGroepDropDownMenu,
                onChanged: (String newValue) {
                  setState(() {
                    groep = newValue;
                    Provider.of<TrainingSaveData>(context, listen: false)
                        .SetGroep(newValue);
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
