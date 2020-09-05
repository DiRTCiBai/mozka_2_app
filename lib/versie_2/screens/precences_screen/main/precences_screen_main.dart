import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/bottom_nav_bar.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/precences_list_tile.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/save_button.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/functions/search_data.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/functions/filters.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/filter_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/time.dart';

class PrecencesScreenMain extends StatefulWidget {
  static const String id = 'PrecencesScreenMain';
  BuildContext context;

  PrecencesScreenMain({this.context});

  @override
  _PrecencesScreenMainState createState() => _PrecencesScreenMainState();
}

class _PrecencesScreenMainState extends State<PrecencesScreenMain> {
  String groep = 'f';
  double _filterMargin = 10;
  Color color = Colors.blue;

  /**************************CHECK-IF-DATA-EXIST*******************************/
  @override
  void initState() {
    super.initState();
    CheckAanwezigheden();
  }

  void CheckAanwezigheden() async {
    FirebaseFirestore _db = FirebaseFirestore.instance;
    String jaar = Time().GetYear();
    String maand = Time().GetMonth();
    String dag = Time().GetDay();

    var data = await _db
        .collection(jaar + 'test')
        .where('datum', isEqualTo: '$dag$maand$jaar')
        .get();

    //ChangeColorSaveButton(data);
    ChangeSwimmerPrecences(data);
  }

  void ChangeColorSaveButton(QuerySnapshot data) {
    if (data.docs.length != 0) {
      setState(() {
        color = Colors.lightGreenAccent;
      });
    }
  }

  void ChangeSwimmerPrecences(QuerySnapshot data) {
    for (var aanwezig in data.docs) {
      if (aanwezig.data()['aanwezig']) {
        CompareSwimmerListID(aanwezig);
      }
    }
  }

  void CompareSwimmerListID(DocumentSnapshot aanwezig) {
    List<SwimmerData2> swimmerlist =
        Provider.of<List<SwimmerData2>>(widget.context, listen: false);

    for (int i = 0; i < swimmerlist.length; i++) {
      if (swimmerlist[i].id == aanwezig.data()['id']) {
        setState(() {
          swimmerlist[i].aanwezig = true;
        });
      }
    }
  }

/*********************************WIDGET***************************************/
  @override
  Widget build(BuildContext context) {
    SwimmerData2 swimmerID;
    List<SwimmerData2> swimmerlist = Provider.of<List<SwimmerData2>>(context);

    void GetName() async {
      var swimmer = await showSearch(
        context: context,
        delegate: SearchPrecencesList(
          list: swimmerlist,
        ),
      );
      swimmerID = swimmer;

      setState(() => swimmerID.aanwezig = !swimmerID.aanwezig);
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Aanwezigheden'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              GetName();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(_filterMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'f';
                    });
                  },
                  selected: groep == 'f' ? true : false,
                  text: 'F',
                ),
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'e';
                    });
                  },
                  selected: groep == 'e' ? true : false,
                  text: 'E',
                ),
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'd';
                    });
                  },
                  selected: groep == 'd' ? true : false,
                  text: 'D',
                ),
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'c';
                    });
                  },
                  selected: groep == 'c' ? true : false,
                  text: 'C',
                ),
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'b';
                    });
                  },
                  selected: groep == 'b' ? true : false,
                  text: 'B',
                ),
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'a';
                    });
                  },
                  selected: groep == 'a' ? true : false,
                  text: 'A',
                ),
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'alle';
                    });
                  },
                  selected: groep == 'alle' ? true : false,
                  text: 'alle',
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  var swimmers = FilterSwimmerList(groep, swimmerlist)[index];
                  return ListTileSwimmer(
                    swimmerData: swimmers,
                    aanwezig: swimmers.aanwezig,
                    onTap: () {
                      setState(() {
                        swimmers.aanwezig = !swimmers.aanwezig;
                      });
                    },
                  );
                },
                itemCount: FilterSwimmerList(groep, swimmerlist).length),
          ),
          PrecencesSaveButton(
            swimmerlist: swimmerlist,
            color: color,
            groep: groep,
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
