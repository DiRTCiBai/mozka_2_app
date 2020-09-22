import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';

class MainTrainingScreen extends StatefulWidget {
  final String trainingen;

  MainTrainingScreen({this.trainingen});

  static const String id = 'MainTrainingScreen';

  @override
  _MainTrainingScreenState createState() => _MainTrainingScreenState();
}

class _MainTrainingScreenState extends State<MainTrainingScreen> {
  String code = '';
  List<int> meters = [];
  List<int> aantalSets = [];
  List<String> oefening = [];

  @override
  Widget build(BuildContext context) {
    code = widget.trainingen;
    DecodeCode();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Training'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: double.infinity),
          Expanded(
            child: ListView(
              children: GetList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }

  List<Widget> GetList() {
    if (oefening.length != 0) {
      List<Widget> list = [];

      int totaal = 0;
      for (int i = 0; i < oefening.length; i++) {
        totaal += meters[i];
        if (aantalSets[i] == 1) {
          list.add(Card(
            child: ListTile(
              leading: Text('${meters[i]}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              title: Text('${oefening[i]}', style: TextStyle(fontSize: 25)),
            ),
          ));
        } else {
          list.add(Card(
            child: ListTile(
              leading: Text('${meters[i]}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              title: Text('${aantalSets[i]}x ${oefening[i]}',
                  style: TextStyle(
                    fontSize: 25,
                  )),
            ),
          ));
        }
      }

      list.add(Card(
        child: ListTile(
          leading: Text('$totaal',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          title: Text('Totaal',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                  fontWeight: FontWeight.bold)),
        ),
      ));

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

    int totaal = 0;

    for (var tot in meters) {
      totaal += tot;
    }
  }

//  List<Widget> Oefeningen() {
//    List<Widget> list = [];
//
//    for (int i = 0; i < widget.trainingen.length; i += 2) {
//      list.add(
//        Oefening(
//          afstand: widget.trainingen[i],
//          oefening: widget.trainingen[i + 1],
//        ),
//      );
//    }
//
//    return list;
//  }
//}

//class Oefening extends StatefulWidget {
//  final String afstand;
//  final String oefening;
//
//  Oefening({this.afstand, this.oefening});
//  @override
//  _OefeningState createState() => _OefeningState();
//}
//
//class _OefeningState extends State<Oefening> {
//  bool color = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      color: color ? kcardDoneColor : kcardNotDoneColor,
//      child: ListTile(
//        leading: Text(
//          '${widget.afstand}m',
//          style: ktextStyleAfstand,
//        ),
//        title: Padding(
//          padding: const EdgeInsets.only(left: 20),
//          child: Text(
//            widget.oefening,
//            style: ktextStyleOefening,
//          ),
//        ),
//        onTap: () {
//          setState(() {
//            color = !color;
//          });
//        },
//      ),
//    );
//  }
}
