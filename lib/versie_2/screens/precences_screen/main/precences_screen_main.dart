import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/bottom_nav_bar.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/precences_list_tile.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/save_button.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/functions/search_data.dart';

class PrecencesScreenMain extends StatefulWidget {
  static const String id = 'PrecencesScreenMain';

  @override
  _PrecencesScreenMainState createState() => _PrecencesScreenMainState();
}

class _PrecencesScreenMainState extends State<PrecencesScreenMain> {
  String groep = 'a';

  @override
  Widget build(BuildContext context) {
    List<SwimmerData2> swimmerlist = Provider.of<List<SwimmerData2>>(context);

    List<SwimmerData2> FilterSwimmerList(String filterValue) {
      List<SwimmerData2> FGroep = [];
      List<SwimmerData2> EGroep = [];
      List<SwimmerData2> DGroep = [];
      List<SwimmerData2> CGroep = [];
      List<SwimmerData2> BGroep = [];
      List<SwimmerData2> AGroep = [];

      for (var swimmer in swimmerlist) {
        if (swimmer.groep == 'f') {
          FGroep.add(swimmer);
        } else if (swimmer.groep == 'e') {
          EGroep.add(swimmer);
        } else if (swimmer.groep == 'd') {
          DGroep.add(swimmer);
        } else if (swimmer.groep == 'c') {
          CGroep.add(swimmer);
        } else if (swimmer.groep == 'b') {
          BGroep.add(swimmer);
        } else if (swimmer.groep == 'a') {
          AGroep.add(swimmer);
        }
      }
      if (filterValue == 'f') return FGroep;
      if (filterValue == 'e') return EGroep;
      if (filterValue == 'd') return DGroep;
      if (filterValue == 'c') return CGroep;
      if (filterValue == 'b') return BGroep;
      if (filterValue == 'a') return AGroep;
      if (filterValue == 'alle') return swimmerlist;
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
              showSearch(
                context: context,
                delegate: SearchPrecencesList(
                  list: swimmerlist,
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DetailButton(
                onTap: () {
                  setState(() {
                    groep = 'f';
                  });
                },
                selected: groep == 'f' ? true : false,
                text: 'F',
              ),
              DetailButton(
                onTap: () {
                  setState(() {
                    groep = 'e';
                  });
                },
                selected: groep == 'e' ? true : false,
                text: 'E',
              ),
              DetailButton(
                onTap: () {
                  setState(() {
                    groep = 'd';
                  });
                },
                selected: groep == 'd' ? true : false,
                text: 'D',
              ),
              DetailButton(
                onTap: () {
                  setState(() {
                    groep = 'c';
                  });
                },
                selected: groep == 'c' ? true : false,
                text: 'C',
              ),
              DetailButton(
                onTap: () {
                  setState(() {
                    groep = 'b';
                  });
                },
                selected: groep == 'b' ? true : false,
                text: 'B',
              ),
              DetailButton(
                onTap: () {
                  setState(() {
                    groep = 'a';
                  });
                },
                selected: groep == 'a' ? true : false,
                text: 'A',
              ),
              DetailButton(
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

          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTileSwimmer(
                    swimmerData: FilterSwimmerList(groep)[index],
                    aanwezig: FilterSwimmerList(groep)[index].aanwezig,
                    onTap: () {
                      setState(() {
                        FilterSwimmerList(groep)[index].aanwezig =
                            !FilterSwimmerList(groep)[index].aanwezig;
                      });
                    },
                  );
                },
                itemCount: FilterSwimmerList(groep).length),
          ),
//          Expanded(
//            child: ListView.builder(
//                itemBuilder: (context, index) {
//                  return ListTileSwimmer(
//                    swimmerData: swimmerlist[index],
//                    aanwezig: swimmerlist[index].aanwezig,
//                    onTap: () {
//                      setState(() {
//                        swimmerlist[index].aanwezig =
//                            !swimmerlist[index].aanwezig;
//                      });
//                    },
//                  );
//                },
//                itemCount: swimmerlist.length),
//          ),
          PrecencesSaveButton(swimmerlist: swimmerlist),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}

class DetailButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool selected;

  DetailButton(
      {@required this.text, @required this.onTap, @required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          color: selected ? Colors.blue : Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15, color: selected ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
