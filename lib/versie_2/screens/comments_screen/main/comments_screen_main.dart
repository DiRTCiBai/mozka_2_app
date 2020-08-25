import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';

class CommentsScreenMain extends StatefulWidget {
  static const id = 'CommentsScreenMain';
  SwimmerData2 swimmerData;

  CommentsScreenMain({this.swimmerData});

  @override
  _CommentsScreenMainState createState() => _CommentsScreenMainState();
}

class _CommentsScreenMainState extends State<CommentsScreenMain> {
  String dropdownValue = 'One';
  final _formKey = GlobalKey<FormState>();
  String comment;

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
            FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  this._formKey.currentState.save();
                  print(comment);
                  Firestore _db = Firestore.instance;

                  _db
                      .collection('opmerkingen')
                      .add({'opmerking': comment, 'id': widget.swimmerData.id});

                  this._formKey.currentState.dispose();
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
