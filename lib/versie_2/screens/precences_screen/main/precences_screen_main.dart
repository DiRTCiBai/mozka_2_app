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
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTileSwimmer(
                    swimmerData: swimmerlist[index],
                    aanwezig: swimmerlist[index].aanwezig,
                    onTap: () {
                      setState(() {
                        swimmerlist[index].aanwezig =
                            !swimmerlist[index].aanwezig;
                      });
                    },
                  );
                },
                itemCount: swimmerlist.length),
          ),
          PrecencesSaveButton(swimmerlist: swimmerlist),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
