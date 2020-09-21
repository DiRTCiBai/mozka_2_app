import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/modules/oefeningen_database.dart';
import 'package:mozka_2_app/screens/training_home_screen/add_training_screen/widget_oefening/main_oefening.dart';
import 'function_save_training.dart';
import 'package:mozka_2_app/screens/training_home_screen/add_training_screen/tabview/widget_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mozka_2_app/screens/training_home_screen/add_training_screen/tabview/function_training_save_data.dart';

class TabBarScreen2 extends StatefulWidget {
  @override
  _TabBarScreen2State createState() => _TabBarScreen2State();
}

class _TabBarScreen2State extends State<TabBarScreen2> {
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    GetUser();
  }

  void GetUser() async {
    loggedInUser = await GetCurrentUser();
  }

  Future<User> GetCurrentUser() async {
    final _auth = FirebaseAuth.instance;
    try {
      final user = _auth.currentUser;
      if (user != null) {
        print(user.email);
        return user;
      }
    } catch (e) {
      print(e);
    }
  }

  String code;
  List<int> meters = [];
  List<int> aantalSets = [];
  List<String> oefening = [];
  int totaal = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            style: TextStyle(fontSize: 20),
            keyboardType: TextInputType.multiline,
            maxLines: 10,
            onChanged: (value) {
              code = value;
              DecodeCode();
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: GetList(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Button(
            text: 'Save',
            color: Colors.blue,
            onTap: () {
              setState(() {
                meters;
                aantalSets;
                oefening;
              });
              //DecodeCode();
              print(code);
              String datum =
                  Provider.of<TrainingSaveData>(context, listen: false)
                      .GetDatum();
              String type =
                  Provider.of<TrainingSaveData>(context, listen: false)
                      .GetType();
              String slag =
                  Provider.of<TrainingSaveData>(context, listen: false)
                      .GetSlag();
              String groep =
                  Provider.of<TrainingSaveData>(context, listen: false)
                      .GetGroep();

              SaveTraining(
                  code, loggedInUser.email, datum, type, slag, groep, totaal);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  List<Widget> GetList() {
    if (oefening.length != 0) {
      List<Widget> list = [];

      int totaal = 0;
      for (int i = 0; i < oefening.length; i++) {
        totaal += meters[i];
        list.add(Text('${meters[i]} ${aantalSets[i]}x ${oefening[i]}',
            style: TextStyle(
              fontSize: 25,
            )));
      }

      list.add(
        Text(
          '${totaal} Totaal',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      );

      return list;
    } else {
      List<Widget> list = [];
      list.add(Text('nog niks'));
      return list;
    }
  }

  void DecodeCode() {
    bool afstand = true;
    bool set = false;
    bool oef = false;
    bool add = true;

    meters = [];
    aantalSets = [];
    oefening = [];

    String afstandInMeters = '';
    String sets = '';
    String oefeningen = '';

    for (int index = 0; index < code.length; index++) {
      add = true;
      if (code[index] == ':') {
        meters.add(int.parse(afstandInMeters));
        set = true;
        afstand = false;
        oef = false;
        add = false;
      } else if (code[index] == '(') {
        if (sets == '') sets = '1';
        aantalSets.add(int.parse(sets));
        set = false;
        afstand = false;
        oef = true;
        add = false;
      } else if (code[index] == ')') {
        set = false;
        afstand = true;
        oef = false;
        add = false;
        setState(() {
          oefening.add(oefeningen);
        });

        afstandInMeters = '';
        sets = '';
        oefeningen = '';
      } else if (code[index] == '\n') {
        //print(code[index]);
        add = false;
      }

      if (add) {
        if (afstand) {
          afstandInMeters += code[index];
        } else if (set) {
          sets += code[index];
        } else if (oef) {
          oefeningen += code[index];
        }
      }
    }

    totaal = 0;

    for (var tot in meters) {
      totaal += tot;
    }
  }
}
