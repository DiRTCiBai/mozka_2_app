import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/bottom_nav_bar.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/precences_list_tile.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/save_button.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/functions/search_data.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/functions/filters.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/filter_button.dart';

class PrecencesScreenMain extends StatefulWidget {
  static const String id = 'PrecencesScreenMain';

  @override
  _PrecencesScreenMainState createState() => _PrecencesScreenMainState();
}

class _PrecencesScreenMainState extends State<PrecencesScreenMain> {
  String groep = 'f';

  @override
  Widget build(BuildContext context) {
    List<SwimmerData2> swimmerlist = Provider.of<List<SwimmerData2>>(context);

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
          PrecencesSaveButton(swimmerlist: swimmerlist),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
