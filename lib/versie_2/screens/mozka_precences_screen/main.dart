import 'package:flutter/material.dart';
import 'custom_futurebuilder_barchart_groep.dart';
import 'package:mozka_2_app/versie_2/screens/mozka_precences_screen/calender/main_calender.dart';
import 'calender/widget_button.dart';

class MozkaPrecencesScreen extends StatefulWidget {
  static const String id = 'MozkaPrecencesScreen';

  @override
  _MozkaPrecencesScreenState createState() => _MozkaPrecencesScreenState();
}

class _MozkaPrecencesScreenState extends State<MozkaPrecencesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Aanwezigheden'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          //CustomFutureBuilderGroep(),
          Calender(),
        ],
      ),
    );
  }
}
