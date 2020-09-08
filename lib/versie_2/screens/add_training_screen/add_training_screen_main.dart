import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/add_training_screen/widget_oefening/main_oefening.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/modules/oefeningen_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convert/convert.dart';
import 'package:mozka_2_app/versie_2/modules/time.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddTrainingScreenMain extends StatefulWidget {
  static const String id = 'AddTrainingScreenMain';

  @override
  _AddTrainingScreenMainState createState() => _AddTrainingScreenMainState();
}

class _AddTrainingScreenMainState extends State<AddTrainingScreenMain> {
  User loggedInUser;
  String dropdownValue = 'Wissel';

  @override
  void initState() {
    super.initState();
    GetUser();
  }

  void GetUser() async {
    loggedInUser = await GetCurrentUser();
  }

  final _auth = FirebaseAuth.instance;

  Future<User> GetCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        print(user.email);
        return user;
      }
    } catch (e) {
      print(e);
    }
  }

  String _date;
  String _type = 'Wissel';

  @override
  Widget build(BuildContext context) {
    if (Provider.of<OefeningenDatabase>(context).GetAantalOefeningen() == 0)
      Provider.of<OefeningenDatabase>(context).ExpanedList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Provider.of<OefeningenDatabase>(context, listen: false)
                  .ClearData();
            }),
        title: Text('Training'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          DropDown(
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
                _type = dropdownValue;
              });
            },
            dropdownValue: dropdownValue,
          ),
          SaveButton(
            text: _date == null ? 'Seleteer datum' : _date,
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2222))
                  .then((date) {
                setState(() {
                  _date = date.toString();
                });
              });
            },
          ),
          Provider.of<OefeningenDatabase>(context).GetAantalOefeningen() != 0
              ? Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Oefening(
                        index: index,
                      );
                    },
                    itemCount: Provider.of<OefeningenDatabase>(context)
                        .GetAantalOefeningen(),
                  ),
                )
              : CircularProgressIndicator(),
          SaveButton(
            text: 'Save',
            onTap: () {
              var data = ConvertListToData();
              SaveTraining(data);
              if (_date != null && data != null) {
                Provider.of<OefeningenDatabase>(context, listen: false)
                    .ClearData();
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }

  String ConvertListToData() {
    var list =
        Provider.of<OefeningenDatabase>(context, listen: false).GetLijst();
    if (list.length != 1) {
      list.remove(list.last);
    }

    List<String> training = [];

    for (var oef in list) {
      training.add(oef.afstand.toString());
      training.add(oef.oefening);

      print(oef.afstand);
      print(oef.oefening);
    }

    var data = jsonEncode(training);
    return data;
//              var decodeData = jsonDecode(data);
//
//              print(decodeData[2]);
  }

  void SaveTraining(String data) {
    FirebaseFirestore _db = FirebaseFirestore.instance;

    print(_date);
    print(data);
    if (_date != null && data != null) {
      _db.collection('trainingen').doc(_date).set({
        'training': data,
        'aanmaakDatum': Time().GetTimeStamp(),
        'sterren': 0,
        'opmerking': '',
        'datum': _date,
        'duur': '',
        'trainer': loggedInUser.email,
        'type': _type,
      });
    }
  }
}

class SaveButton extends StatelessWidget {
  final String text;
  final Function onTap;

  SaveButton({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
            color: Colors.blue,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          ),
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  final Function onChanged;
  final String dropdownValue;

  DropDown({this.onChanged, this.dropdownValue});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChanged,
      items: <String>[
        'Vlinderslag',
        'Rugslag',
        'Schoolslag',
        'Vrijeslag',
        'Wissel'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
