import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/screens/add_swimmer_screen/function_save_to_firestore.dart';

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  SwimmerData2 swimmerData = SwimmerData2(geslacht: 'man');

  bool gender = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Voornaam',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => swimmerData.voornaam = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Achternaam',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => swimmerData.achternaam = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Geboortejaar',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (value) => swimmerData.geboortejaar = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => swimmerData.email = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Groep',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (value) => swimmerData.groep = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a, b, c, d, e, f';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            //zet gender false en zet geslacht op man
                            setState(() {
                              gender = !gender;
                            });
                            swimmerData.geslacht = 'man';
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: gender ? Colors.blue : Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'man',
                                style: TextStyle(
                                  color: gender ? Colors.white : Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            child: Center(
                              child: Text(
                                'vrouw',
                                style: TextStyle(
                                  color: gender ? Colors.black : Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: gender ? Colors.white : Colors.blue,
                            ),
                          ),
                          onTap: () {
                            //zet gender true en zet geslacht op vrouw
                            setState(() {
                              gender = !gender;
                            });
                            swimmerData.geslacht = 'vrouw';
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 175, bottom: 10),
          child: FlatButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                this._formKey.currentState.save();
                //als alle forms zijn ingevuld sla data op in swimmerdata object
                //sla het object op in firestore
                SaveSwimmerDataToFirestore(swimmerData);
                Navigator.pop(context);
              }
            },
            child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Opslaan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
