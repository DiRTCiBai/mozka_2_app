import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/mozka_precences_screen/calender/main_calender.dart';

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
