import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/add_swimmer_screen/widgets/inputfield_email.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/add_swimmer_screen/widgets/inputfield_text.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/add_swimmer_screen/widgets/gender_selecter_button.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/add_swimmer_screen/widgets/inputfield_numbers.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/root/constants.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/modules/firebase/firebase_interface.dart';

class MainEditSwimmerScreen extends StatefulWidget {
  static const String id = 'AddSwimmers';
  SwimmerData swimmerData;

  MainEditSwimmerScreen({this.swimmerData});
  @override
  _MainEditSwimmerScreenState createState() => _MainEditSwimmerScreenState();
}

class _MainEditSwimmerScreenState extends State<MainEditSwimmerScreen> {
  SwimmerData swimmer;
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  SwimmerData tempSwimmer = SwimmerData();

  bool isDataComplete(SwimmerData swimmerData) {
    if (swimmerData.voornaam == null ||
        swimmerData.achternaam == null ||
        swimmerData.geboortejaar == null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    tempSwimmer = widget.swimmerData;

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
                      hintText: '${widget.swimmerData.voornaam}',
                      onChanged: (value) {
                        tempSwimmer.voornaam = value;
                      },
                    ),
                    InputFieldText(
                      hintText: '${widget.swimmerData.achternaam}',
                      onChanged: (value) {
                        tempSwimmer.achternaam = value;
                      },
                    ),
                    InputFieldNumbers(
                      hintText: '${widget.swimmerData.geboortejaar}',
                      onChanged: (value) {
                        tempSwimmer.geboortejaar = int.parse(value);
                      },
                    ),
                    InputFieldEmail(
                      hintText: '${widget.swimmerData.email}',
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
//                      AddScreenButton(
//                        text: 'Save',
//                        onPressed: () {
//                          if (isDataComplete(tempSwimmer)) {
//                            CheckSaveData(context);
//                          } else {
//                            setState(() {
//                              fireBaseInterface.EditSwimmer(tempSwimmer);
//                            });
//                            Navigator.pop(context, tempSwimmer);
//                          }
//                        },
//                      ),
                      SizedBox(
                        height: 10.0,
                      ),
//                      AddScreenButton(
//                        text: 'Cancel',
//                        onPressed: () {
//                          Navigator.pop(context);
//                        },
//                      ),
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
