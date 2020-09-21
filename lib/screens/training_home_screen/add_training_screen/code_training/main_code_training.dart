import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/oefeningen_database.dart';
import 'package:mozka_2_app/modules/trainingen.dart';
import 'package:mozka_2_app/screens/training_home_screen/add_training_screen/widget_oefening/main_oefening.dart';
import 'package:mozka_2_app/screens/training_screen/main_training_screen.dart';

class MainCodeTraining extends StatefulWidget {
  static const String id = 'MainCodeTraining';
  @override
  _MainCodeTrainingState createState() => _MainCodeTrainingState();
}

class _MainCodeTrainingState extends State<MainCodeTraining> {
  String code;
  List<int> meters = [];
  List<int> aantalSets = [];
  List<String> oefening = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training code test'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 10,
            onChanged: (value) {
              code = value;
              DecodeCode();
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView(
                children: GetList(),
              ),
            ),
          ),
          FlatButton(
            child: Text('print'),
            onPressed: () {
              setState(() {
                meters;
                aantalSets;
                oefening;
              });
              //DecodeCode();
              print(code);
            },
          ),
        ],
      ),
    );
  }

  List<Widget> GetList() {
    if (oefening.length != 0) {
      List<Widget> list = [];

      int totaal = 0;
      for (int i = 0; i < oefening.length; i++) {
        totaal += meters[i];
        list.add(Text('${meters[i]} ${aantalSets[i]}x ${oefening[i]}',
            style: TextStyle(
              fontSize: 25,
            )));
      }

      list.add(
        Text(
          '${totaal} Totaal',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      );

      return list;
    } else {
      List<Widget> list = [];
      list.add(Text('nog niks'));
      return list;
    }
  }

  void DecodeCode() {
    bool afstand = true;
    bool set = false;
    bool oef = false;
    bool add = true;

    meters = [];
    aantalSets = [];
    oefening = [];

    String afstandInMeters = '';
    String sets = '';
    String oefeningen = '';

    for (int index = 0; index < code.length; index++) {
      add = true;
      if (code[index] == ':') {
        meters.add(int.parse(afstandInMeters));
        set = true;
        afstand = false;
        oef = false;
        add = false;
      } else if (code[index] == '(') {
        if (sets == '') sets = '1';
        aantalSets.add(int.parse(sets));
        set = false;
        afstand = false;
        oef = true;
        add = false;
      } else if (code[index] == ')') {
        set = false;
        afstand = true;
        oef = false;
        add = false;
        setState(() {
          oefening.add(oefeningen);
        });

        afstandInMeters = '';
        sets = '';
        oefeningen = '';
      } else if (code[index] == '\n') {
        //print(code[index]);
        add = false;
      }

      if (add) {
        if (afstand) {
          afstandInMeters += code[index];
        } else if (set) {
          sets += code[index];
        } else if (oef) {
          oefeningen += code[index];
        }
      }
    }

    int totaal = 0;

    for (var tot in meters) {
      totaal += tot;
    }
  }
}
