import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/basic_info_card.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/screens/edit_swimmer_data_screen/main/edit_swimmer_data_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/bottom_nav_bar.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/custom_drawer.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/total_precences_chart.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/functions/chardata.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/group_info_card.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/card_titles.dart';
import 'package:mozka_2_app/root/constants.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/functions/future_chartdata.dart';

class PersonalSwimmerDataSCreenMain extends StatefulWidget {
  static const String id = 'PersonalSwimmerDataSCreenMain';
  final SwimmerData2 swimmerData;

  PersonalSwimmerDataSCreenMain({this.swimmerData});

  @override
  _PersonalSwimmerDataSCreenMainState createState() =>
      _PersonalSwimmerDataSCreenMainState();
}

class _PersonalSwimmerDataSCreenMainState
    extends State<PersonalSwimmerDataSCreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        swimmerData: widget.swimmerData,
      ),
      appBar: AppBar(
//        leading: IconButton(
//            icon: Icon(Icons.arrow_back),
//            onPressed: () => Navigator.pop(context)),
        title: Text('Persoonlijke gegevens'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditSwimmerDataScreenMain(
                  swimmerData: widget.swimmerData,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CircleAvatar(
              backgroundColor: widget.swimmerData.geslacht == 'man'
                  ? kmanColor
                  : kfemakeColor,
              radius: 50.0,
              child: Text(
                '${widget.swimmerData.voornaam[0].toUpperCase()}${widget.swimmerData.achternaam[0].toUpperCase()}',
                style: TextStyle(fontSize: 45, color: Colors.white),
              ),
            ),
          ),
          BasicInfoCard(
            swimmerData: widget.swimmerData,
          ),
          CardTitles(
            title: 'Groep info',
          ),
          GroupInfoCard(
            swimmerData: widget.swimmerData,
          ),
          CardTitles(
            title: 'Aanwezigheden',
          ),
          FutureBuilder(
            future: Aanwezigheden(widget.swimmerData),
            builder: (BuildContext context, AsyncSnapshot<ChartData> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.total != 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      child: TotalPrecencesChart(
                        total: snapshot.data.total,
                        aanwezig: snapshot.data.precences,
                      ),
                    ),
                  );
                } else {
                  return Center(child: Text('heeft nog geen data'));
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
