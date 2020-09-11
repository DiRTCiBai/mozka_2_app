import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/modules/oefeningen_database.dart';
import 'package:mozka_2_app/versie_2/screens/training_home_screen/add_training_screen/widget_oefening/main_oefening.dart';
import 'function_save_training.dart';
import 'package:mozka_2_app/versie_2/screens/training_home_screen/add_training_screen/tabview/widget_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mozka_2_app/versie_2/screens/training_home_screen/add_training_screen/tabview/function_training_save_data.dart';

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
      final user = await _auth.currentUser;
      if (user != null) {
        print(user.email);
        return user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    void CheckIfHasData(String datum, String data) {
      if (datum != null && data != null) {
        Provider.of<OefeningenDatabase>(context, listen: false).ClearData();
        Navigator.pop(context);
      }
    }

    if (Provider.of<OefeningenDatabase>(context).GetAantalOefeningen() == 0)
      Provider.of<OefeningenDatabase>(context).ExpanedList();

    return Column(
      children: <Widget>[
        Container(
          child:
              Provider.of<OefeningenDatabase>(context).GetAantalOefeningen() !=
                      0
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
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Button(
            color: Colors.blue,
            text: 'Opslaan',
            onTap: () {
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

              var data = ConvertListToData(context);
              SaveTraining(data, loggedInUser.email, datum, type, slag, groep);

              CheckIfHasData(datum, data);
            },
          ),
        ),
      ],
    );
  }
}
