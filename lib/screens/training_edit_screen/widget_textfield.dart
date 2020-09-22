import 'package:flutter/material.dart';
import 'function_update_training.dart';
import 'package:mozka_2_app/modules/widget_button.dart';
import 'widget_decoded_oefeningen_lijst.dart';

class EditTextField extends StatefulWidget {
  final TextEditingController controler;
  final String trainingId;

  EditTextField({@required this.controler, @required this.trainingId});

  @override
  _EditTextFieldState createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<EditTextField> {
  String code;
  List<int> meters = [];
  List<int> aantalSets = [];
  List<String> oefening = [];
  int totaal = 0;

  @override
  void initState() {
    super.initState();
    code = widget.controler.text;
    DecodeCode();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: widget.controler,
            style: TextStyle(
              fontSize: 25,
            ),
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(),
            onChanged: (value) {
              code = value;
              DecodeCode();
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: GetList(oefening, meters, aantalSets),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Button(
            text: 'Update',
            color: Colors.blue,
            onTap: () {
              print(widget.trainingId);
              SaveTraining(code, totaal, widget.trainingId);
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
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

    totaal = 0;

    for (var tot in meters) {
      totaal += tot;
    }
  }
}
