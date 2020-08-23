import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/screens/add_swimmer_screen/functions/save_to_firestore.dart';

class CustomForm extends StatefulWidget {
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  SwimmerData swimmerData = SwimmerData(geslacht: 'man');

  bool gender = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    FlatButton(
                      child: Text('man'),
                      color: gender ? Colors.blue : Colors.white,
                      onPressed: () {
                        setState(() {
                          gender = !gender;
                        });

                        swimmerData.geslacht = 'man';
                      },
                    ),
                    FlatButton(
                      child: Text('vrouw'),
                      color: gender ? Colors.white : Colors.blue,
                      onPressed: () {
                        setState(() {
                          gender = !gender;
                        });

                        swimmerData.geslacht = 'vrouw';
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        this._formKey.currentState.save();
                        swimmerData.PrintSwimmerData();
                        SaveSwimmerDataToFirestore(swimmerData);
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
