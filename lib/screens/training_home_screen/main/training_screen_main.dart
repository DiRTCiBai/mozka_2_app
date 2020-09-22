import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/training_edit_screen/main_training_edit_screen.dart';
import 'package:mozka_2_app/screens/training_home_screen/add_training_screen/code_training/main_code_training.dart';
import 'package:mozka_2_app/screens/training_home_screen/listview/main_listview.dart';
import 'widget_button.dart';
import 'bottom_nav_bar.dart';
import 'package:mozka_2_app/screens/training_home_screen/add_training_screen/tabview/main_tabview.dart';
import 'package:mozka_2_app/screens/training_home_screen/listview/groep_filter/main_groep_filter.dart';
import 'package:mozka_2_app/screens/training_home_screen/constants.dart';

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
        title: Text(kTitleAppBar),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MainGroepFilter(),
            Expanded(child: TrainingenListview()),
            Button(
              text: kButtonText,
              onTap: () => Navigator.pushNamed(context, MainTrainingTabBar.id),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
