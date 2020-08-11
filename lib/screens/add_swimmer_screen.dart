import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/toevoeg_scherm_widgets/inputfield_email.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/toevoeg_scherm_widgets/inputfield_text.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/toevoeg_scherm_widgets/add_screen_button.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/toevoeg_scherm_widgets/gender_selecter_button.dart';
import 'package:mozka_2_app/widgets/toevoeg_scherm_widgets/inputfield_numbers.dart';
import 'package:mozka_2_app/constants.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';

class AddSwimmers extends StatefulWidget {
  static const String id = 'AddSwimmers';

  @override
  _AddSwimmersState createState() => _AddSwimmersState();
}

class _AddSwimmersState extends State<AddSwimmers> {
  bool gender = true;
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  SwimmerData tempSwimmer = SwimmerData();

  void ToggleGender() {
    setState(() {
      gender = !gender;
    });

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
                            displayText: 'Man',
                            onTap: ToggleGender,
                          ),
                          GenderSelecterCard(
                            color: gender
                                ? kinactiveGenderColor
                                : kactiveGenderColor,
                            displayText: 'Vrouw',
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
                            fireBaseInterface.AddSwimmer(tempSwimmer);
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

