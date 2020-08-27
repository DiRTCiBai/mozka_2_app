import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/precences_list_tile.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/versie_2/modules/time.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/functions/save_precences.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/functions/save_precences.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/widgets/save_button.dart';

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
    );
  }
}
