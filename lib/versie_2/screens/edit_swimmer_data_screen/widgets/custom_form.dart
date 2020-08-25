import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/screens/edit_swimmer_data_screen/functions/save_edit_to_firestore.dart';

class CustomForm extends StatefulWidget {
  SwimmerData2 swimmerData;

  CustomForm({this.swimmerData});
  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  bool gender;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gender = widget.swimmerData.geslacht == 'man' ? true : false;
  }

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
                    initialValue: widget.swimmerData.voornaam,
                    onSaved: (value) => widget.swimmerData.voornaam = value,
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
                    initialValue: widget.swimmerData.achternaam,
                    onSaved: (value) => widget.swimmerData.achternaam = value,
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
                    initialValue: widget.swimmerData.geboortejaar,
                    keyboardType: TextInputType.number,
                    onSaved: (value) => widget.swimmerData.geboortejaar = value,
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
                    initialValue: widget.swimmerData.email,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (value) => widget.swimmerData.email = value,
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
                    initialValue: widget.swimmerData.groep,
                    onSaved: (value) => widget.swimmerData.groep = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                      child: Text('man'),
                      color: gender ? Colors.blue : Colors.white,
                      onPressed: () {
                        //zet gender false en zet geslacht op man
                        setState(() {
                          gender = !gender;
                        });
                        widget.swimmerData.geslacht = 'man';
                      },
                    ),
                    FlatButton(
                      child: Text('vrouw'),
                      color: gender ? Colors.white : Colors.blue,
                      onPressed: () {
                        //zet gender true en zet geslacht op vrouw
                        setState(() {
                          gender = !gender;
                        });
                        widget.swimmerData.geslacht = 'vrouw';
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
                        //als alle forms zijn ingevuld sla data op in swimmerdata object
                        //sla het object op in firestore
                        SaveEditSwimmerDataToFirestore(widget.swimmerData);
                      }
                    },
                    child: Text('Save'),
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
