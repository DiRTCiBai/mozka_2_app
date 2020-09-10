import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottom_nav_bar.dart';

class MainTrainingScreen extends StatefulWidget {
  final List<dynamic> trainingen;

  MainTrainingScreen({this.trainingen});

  static const String id = 'MainTrainingScreen';

  @override
  _MainTrainingScreenState createState() => _MainTrainingScreenState();
}

class _MainTrainingScreenState extends State<MainTrainingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Training'),
      ),
      body: ListView(
        children: Oefeningen(),
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }

  List<Widget> Oefeningen() {
    List<Widget> list = [];

    for (int i = 0; i < widget.trainingen.length; i += 2) {
      list.add(
        Oefening(
          afstand: widget.trainingen[i],
          oefening: widget.trainingen[i + 1],
        ),
      );
    }

    return list;
  }
}

class Oefening extends StatefulWidget {
  final String afstand;
  final String oefening;

  Oefening({this.afstand, this.oefening});
  @override
  _OefeningState createState() => _OefeningState();
}

class _OefeningState extends State<Oefening> {
  bool color = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ? kcardDoneColor : kcardNotDoneColor,
      child: ListTile(
        leading: Text(
          '${widget.afstand}m',
          style: ktextStyleAfstand,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            widget.oefening,
            style: ktextStyleOefening,
          ),
        ),
        onTap: () {
          setState(() {
            color = !color;
          });
        },
      ),
    );
  }
}
