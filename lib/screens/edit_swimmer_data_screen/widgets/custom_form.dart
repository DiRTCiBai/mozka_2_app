import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/screens/edit_swimmer_data_screen/functions/save_edit_to_firestore.dart';

class CustomForm extends StatefulWidget {
  SwimmerData2 swimmerData;

  CustomForm({this.swimmerData});
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  SwimmerData2 swimmerData;
  bool gender;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gender = widget.swimmerData.geslacht == 'man' ? true : false;
    swimmerData = SwimmerData2(geslacht: 'man', id: widget.swimmerData.id);
  }

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
                    initialValue: widget.swimmerData.voornaam,
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
                    initialValue: widget.swimmerData.achternaam,
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
                    initialValue: widget.swimmerData.geboortejaar,
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
                    initialValue: widget.swimmerData.email,
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
                    initialValue: widget.swimmerData.groep,
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
                SaveEditSwimmerDataToFirestore(swimmerData);
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
