import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/modules/oefeningen_database.dart';
import 'function_training_save_data.dart';
import 'tabscreen_1/main_tabscreen_1.dart';
import 'tabscreen_2/main_tabscreen_2.dart';

class MainTrainingTabBar extends StatelessWidget {
  static const String id = 'MainTrainingTabBar';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TrainingSaveData()),
      ],
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                  Provider.of<OefeningenDatabase>(context, listen: false)
                      .ClearData();
                }),
            title: Text('Training'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'Gegevens'),
                Tab(text: 'Training'),
              ],
            ),
          ),
          body: TabBarView(children: [
            TabBarScreen1(),
            TabBarScreen2(),
          ]),
        ),
      ),
    );
  }
}
