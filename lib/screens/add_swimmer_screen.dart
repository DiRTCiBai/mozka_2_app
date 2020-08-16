import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/toevoeg_scherm_widgets/inputfield_email.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/toevoeg_scherm_widgets/inputfield_text.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/toevoeg_scherm_widgets/add_screen_button.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/toevoeg_scherm_widgets/gender_selecter_button.dart';
import 'package:mozka_2_app/widgets/toevoeg_scherm_widgets/inputfield_numbers.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/root/constants.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';
import 'package:mozka_2_app/modules/allermessage.dart';

class AddSwimmers extends StatefulWidget {
  static const String id = 'AddSwimmers';

  @override
  _AddSwimmersState createState() => _AddSwimmersState();
}

class _AddSwimmersState extends State<AddSwimmers> {
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  SwimmerData tempSwimmer = SwimmerData();

  bool isDataComplete() {
    if (tempSwimmer.voornaam == null ||
        tempSwimmer.achternaam == null ||
        tempSwimmer.geboortejaar == null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      tempSwimmer.achternaam = value;
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
                          color: tempSwimmer.geslacht == 'man'
                              ? kactiveGenderColor
                              : kinactiveGenderColor,
                          displayText: 'Man',
                          onTap: () {
                            setState(() {
                              tempSwimmer.ToggleGender();
                            });
                          },
                        ),
                        GenderSelecterCard(
                          color: tempSwimmer.geslacht == 'man'
                              ? kinactiveGenderColor
                              : kactiveGenderColor,
                          displayText: 'Vrouw',
                          onTap: () {
                            setState(() {
                              tempSwimmer.ToggleGender();
                            });
                          },
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
                    SizedBox(
                      height: 20,
                    ),
                    AddButton(
                      displayText: 'Save',
                      onPressed: () {
                        if (isDataComplete()) {
                          CheckSaveData(context);
                        } else {
                          fireBaseInterface.AddSwimmer(tempSwimmer);
                          Navigator.pop(context, tempSwimmer);
                        }
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    AddButton(
                      displayText: 'Cancel',
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
    );
  }
}

class AddButton extends StatelessWidget {
  final String displayText;
  final Function onPressed;

  AddButton({@required this.displayText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        width: 150,
        decoration: kaanwezighedenButtonBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Center(
            child: Text(
              displayText,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
