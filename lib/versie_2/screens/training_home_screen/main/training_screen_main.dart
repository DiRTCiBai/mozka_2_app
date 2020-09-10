import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/add_training_screen/add_training_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/training_home_screen/listview/main_listview.dart';
import 'widget_button.dart';
import 'bottom_nav_bar.dart';

class TrainingScreenMain extends StatefulWidget {
  static const String id = 'TrainingScreenMain';
  @override
  _TrainingScreenMainState createState() => _TrainingScreenMainState();
}

class _TrainingScreenMainState extends State<TrainingScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: TrainingenListview()),
            Button(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddTrainingScreenMain()),
                );
              },
              text: 'maak training',
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
