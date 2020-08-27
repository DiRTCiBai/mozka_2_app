import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/modules/time.dart';

class AddCommentsScreenMain extends StatefulWidget {
  static const id = 'CommentsScreenMain';
  SwimmerData2 swimmerData;

  AddCommentsScreenMain({this.swimmerData});

  @override
  _AddCommentsScreenMainState createState() => _AddCommentsScreenMainState();
}

class _AddCommentsScreenMainState extends State<AddCommentsScreenMain> {
  String dropdownValue = 'One';
  final _formKey = GlobalKey<FormState>();
  String comment;
  String titel;
  String detailOpmerking = 'algemeen';
  List<bool> isSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Toevoegen'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'titel',
                ),
                onSaved: (value) => titel = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Opmerking',
                ),
                maxLines: 5,
                onSaved: (value) => comment = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            ToggleButtons(
              children: <Widget>[
                Text('benen'),
                Text('armen'),
                Text('hoofd'),
                Text('keerpunt'),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = !isSelected[buttonIndex];
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelected,
            ),
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  this._formKey.currentState.save();
                  print(comment);
                  Firestore _db = Firestore.instance;

                  if (isSelected[0] == true) {
                    detailOpmerking = 'benen';
                  } else if (isSelected[1] == true) {
                    detailOpmerking = 'armen';
                  } else if (isSelected[2] == true) {
                    detailOpmerking = 'hoofd';
                  } else if (isSelected[3] == true) {
                    detailOpmerking = 'keerpunt';
                  } else {
                    detailOpmerking = 'algemeen';
                  }

                  _db.collection('opmerkingen').add({
                    'titel': titel,
                    'opmerking': comment,
                    'id': widget.swimmerData.id,
                    'datum': Time().GetDate(),
                    'detail': detailOpmerking,
                  });

                  this._formKey.currentState.dispose();
                  Navigator.pop(context);
                }
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
