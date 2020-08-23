import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:mozka_2_app/root/constants.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/screens/tabview_swimmers_list/add_swimmer_screen/widgets/form/gender_selecter_button.dart';
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  SwimmerData swimmerData = SwimmerData();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
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
                onSaved: (value) => swimmerData.geboortejaar = int.parse(value),
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GenderSelecterCard(
                    color: swimmerData.geslacht == 'man'
                        ? kactiveGenderColor
                        : kinactiveGenderColor,
                    displayText: 'Man',
                    onTap: () {
                      setState(() {
                        swimmerData.ToggleGender();
                      });
                    },
                  ),
                  GenderSelecterCard(
                    color: swimmerData.geslacht == 'man'
                        ? kinactiveGenderColor
                        : kactiveGenderColor,
                    displayText: 'Vrouw',
                    onTap: () {
                      setState(() {
                        swimmerData.ToggleGender();
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false
                  // otherwise.
                  if (_formKey.currentState.validate()) {
                    this._formKey.currentState.save();
                    // If the form is valid, display a Snackbar.
//
                    fireBaseInterface.AddSwimmer(swimmerData);
                    Navigator.pop(context, true);
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
