import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/add_training_screen/widget_oefening/main_oefening.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/modules/oefeningen_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'function_user_info.dart';
import 'widget_dropdown_menu.dart';
import 'widget_button.dart';
import 'function_save_training.dart';

const String kstartValueTypeTraining = 'Wissel';

class AddTrainingScreenMain extends StatefulWidget {
  static const String id = 'AddTrainingScreenMain';

  @override
  _AddTrainingScreenMainState createState() => _AddTrainingScreenMainState();
}

class _AddTrainingScreenMainState extends State<AddTrainingScreenMain> {
  User loggedInUser;
  String dropdownValue = kstartValueTypeTraining;
  String _date;
  String _type = kstartValueTypeTraining;

  @override
  void initState() {
    super.initState();
    GetUser();
  }

  void GetUser() async {
    loggedInUser = await GetCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<OefeningenDatabase>(context).GetAantalOefeningen() == 0)
      Provider.of<OefeningenDatabase>(context).ExpanedList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Provider.of<OefeningenDatabase>(context, listen: false)
                  .ClearData();
            }),
        title: Text('Training'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropDown(
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      _type = dropdownValue;
                    });
                  },
                  dropdownValue: dropdownValue,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Button(
                    text: _date == null
                        ? 'Seleteer datum'
                        : _date.replaceRange(10, 23, ''),
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2222))
                          .then((date) {
                        setState(() {
                          _date = date.toString();
                        });
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Provider.of<OefeningenDatabase>(context).GetAantalOefeningen() != 0
              ? Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Oefening(
                        index: index,
                      );
                    },
                    itemCount: Provider.of<OefeningenDatabase>(context)
                        .GetAantalOefeningen(),
                  ),
                )
              : CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Button(
              text: 'Save',
              onTap: () {
                var data = ConvertListToData(context);
                SaveTraining(data, loggedInUser.email, _date, _type);
                if (_date != null && data != null) {
                  Provider.of<OefeningenDatabase>(context, listen: false)
                      .ClearData();
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
