import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/toevoeg_scherm_widgets/inputfield_email.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/toevoeg_scherm_widgets/inputfield_text.dart';
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
      appBar: AppBar(
        title: Text('Toevoegen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              flex: 10,
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
              child: AddButton(
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
      color: Colors.blue,
      child: Center(
        child: Text(
          displayText,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
