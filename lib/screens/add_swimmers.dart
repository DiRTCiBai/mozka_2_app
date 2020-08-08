import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/data_swimmers.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/add_screen/inputfield_numbers.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/add_screen/inputfield_text.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/add_screen/add_screen_button.dart';
import 'package:mozka_2_app/modules/gender.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/add_screen/inputfield_email.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/add_screen/gender_selecter_button.dart';
import 'package:mozka_2_app/constants.dart';

class AddSwimmers extends StatefulWidget {
  static const String id = 'AddSwimmers';

  @override
  _AddSwimmersState createState() => _AddSwimmersState();
}

class _AddSwimmersState extends State<AddSwimmers> {
  bool gender = true;

  Swimmers tempSwimmer = Swimmers();

  void ToggleGender() {
    setState(() {
      gender = !gender;
    });

    if (gender) {
      tempSwimmer.geslacht = Gender.vrouw;
    } else {
      tempSwimmer.geslacht = Gender.man;
    }
    tempSwimmer.ToggleGender();
  }

  Future<void> CheckSaveData() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('gegevens niet compleet'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Vologende velden moeten worden ingevuld:\n'),
                Text('Voornaam, achternaam en geboortejaar'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('oke'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InputFieldText(
                      hintText: 'voornaam',
                      onChanged: (value) {
                        tempSwimmer.voornaam = value;
                      },
                    ),
                    InputFieldText(
                      hintText: 'achternaam',
                      onChanged: (value) {
                        tempSwimmer.achernaam = value;
                      },
                    ),
                    InputFieldNumbers(
                      hintText: 'geboortejaar',
                      onChanged: (value) {
                        tempSwimmer.geboortejaar = int.parse(value);
                      },
                    ),
                    InputFieldEmail(
                      hintText: 'email',
                      onChanged: (value) {
                        tempSwimmer.email = value;
                      },
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GenderSelecterCard(
                            color: gender
                                ? kactiveGenderColor
                                : kinactiveGenderColor,
                            text: 'Man',
                            onTap: ToggleGender,
                          ),
                          GenderSelecterCard(
                            color: gender
                                ? kinactiveGenderColor
                                : kactiveGenderColor,
                            text: 'Vrouw',
                            onTap: ToggleGender,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      AddScreenButton(
                        text: 'Save',
                        onPressed: () {
                          if (tempSwimmer.voornaam == null ||
                              tempSwimmer.achernaam == null ||
                              tempSwimmer.geboortejaar == null) {
                            CheckSaveData();
                          } else {
                            Navigator.pop(context, tempSwimmer);
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      AddScreenButton(
                        text: 'Cancel',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
