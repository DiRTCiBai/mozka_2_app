import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/precences_screen/widgets/bottom_nav_bar.dart';
import 'package:mozka_2_app/screens/precences_screen/widgets/precences_list_tile.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/screens/precences_screen/widgets/save_button.dart';
import 'package:mozka_2_app/screens/precences_screen/functions/search_data.dart';
import 'package:mozka_2_app/screens/precences_screen/widgets/filter_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/time.dart';
import 'groep_filter/main_groep_filter.dart';
import 'package:mozka_2_app/modules/filter_database.dart';
import 'package:mozka_2_app/modules/groep_filter/function_groep_filter.dart';

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
            child: MainGroepFilter(),
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  var swimmers = FilterSwimmerList(
                      Provider.of<FilterDatabase>(context).GetFilter(),
                      swimmerlist)[index];
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
                itemCount: FilterSwimmerList(
                        Provider.of<FilterDatabase>(context).GetFilter(),
                        swimmerlist)
                    .length),
          ),
          PrecencesSaveButton(
            swimmerlist: swimmerlist,
            color: color,
            groep: Provider.of<FilterDatabase>(context).GetFilter(),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
