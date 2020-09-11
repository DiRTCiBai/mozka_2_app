import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/modules/oefeningen_database.dart';
import 'widget_add_oef_button.dart';
import 'widget_training_oef_inputfield.dart';
import 'widget_training_afstand_inputfield.dart';

class Oefening extends StatefulWidget {
  final int index;

  Oefening({this.index});

  @override
  _OefeningState createState() => _OefeningState();
}

class _OefeningState extends State<Oefening> {
  OefeningenData oefeningenData = OefeningenData(oefening: '', afstand: 0);

  bool isVisible = false;
  bool expand = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Table(
            columnWidths: {
              0: kcolumn1Width,
              1: kcolumn2Width,
            },
            children: [
              TableRow(
                children: [
                  TrainingAfstandInputField(
                    hintText: '000',
                    saved: isVisible,
                    onTap: onPressTextField,
                    onChanged: (value) {
                      oefeningenData.afstand = int.parse(value);
                    },
                  ),
                  TrainingOefeningInputField(
                    hintText: 'Oefening',
                    saved: isVisible,
                    onTap: onPressTextField,
                    onChanged: (value) {
                      oefeningenData.oefening = value;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        AddOefeningButton(
          oefeningenData: oefeningenData,
          isVisible: isVisible,
          onPressed: () {
            ExpanedOefeningenLijst();
            SaveOefeningenToLijst();
          },
        ),
      ],
    );
  }

  void onPressTextField() {
    setState(() {
      isVisible = true;
    });
  }

  void SaveOefeningenToLijst() {
    Provider.of<OefeningenDatabase>(context, listen: false)
        .AddOef(oefeningenData, widget.index);
    setState(() {
      isVisible = !isVisible;
    });
  }

  void ExpanedOefeningenLijst() {
    if (expand) {
      Provider.of<OefeningenDatabase>(context, listen: false).ExpanedList();
      expand = false;
    }
  }
}
