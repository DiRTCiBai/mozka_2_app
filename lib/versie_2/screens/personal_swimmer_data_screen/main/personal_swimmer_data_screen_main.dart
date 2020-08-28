import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/basic_info_card.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/screens/edit_swimmer_data_screen/main/edit_swimmer_data_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/total_precences_chart.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/functions/chardata.dart';
import 'package:mozka_2_app/versie_2/modules/time.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/functions/future_chardata.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/functions/future_chartdata_year.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/group_info_card.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/widgets/card_titles.dart';
import 'package:mozka_2_app/root/constants.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_comments_screen/main/list_of_comments_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/home_screen/main/home_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/main/precences_screen_main.dart';

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
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.popUntil(context, ModalRoute.withName(HomeScreenMain.id));
    }
    if (index == 2) {
      Navigator.popUntil(context, ModalRoute.withName(HomeScreenMain.id));
      Navigator.pushNamed(context, PrecencesScreenMain.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Opmerkingen'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ListOfCommentsMain(
                              swimmerData: widget.swimmerData,
                            )));
              },
            ),
            ListTile(
              title: Text('Aanwezigheden'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Vooruitgang'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
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
            future: Aanwezigheden(),
            builder: (BuildContext context, AsyncSnapshot<ChartData> snapshot) {
              if (snapshot.hasData) {
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
                return CircularProgressIndicator();
              }
            },
          ),

//              if (snapshot.hasData) {),

//          FutureBuilder(
//            future: GetPrecencesChartData(
//                year: Time().GetYear(),
//                month: Time().GetMonth(),
//                swimmerData: swimmerData),
//            builder: (BuildContext context, AsyncSnapshot<ChartData> snapshot) {
//              if (snapshot.hasData) {
//                return Column(
//                  children: <Widget>[
//                    Text('maand'),
//                    TotalPrecencesChart(
//                      total: snapshot.data.total,
//                      aanwezig: snapshot.data.precences,
//                    ),
//                  ],
//                );
//              } else {
//                return CircularProgressIndicator();
//              }
//            },
//          ),
//          FutureBuilder(
//            future: GetPrecencesChartDataMonth(
//                year: Time().GetYear(),
//                month: Time().GetMonth(),
//                swimmerData: swimmerData),
//            builder: (BuildContext context, AsyncSnapshot<ChartData> snapshot) {
//              if (snapshot.hasData) {
//                return Column(
//                  children: <Widget>[
//                    Text('Jaar'),
//                    TotalPrecencesChart(
//                      total: snapshot.data.total,
//                      aanwezig: snapshot.data.precences,
//                    ),
//                  ],
//                );
//              } else {
//                return CircularProgressIndicator();
//              }
//            },
//          ),

//
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Zwemmers'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            title: Text('Aanwezigheden'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  Future<ChartData> Aanwezigheden() async {
    String jaar = Time().GetYear() + 'test';
    FirebaseFirestore _db = FirebaseFirestore.instance;
    int numberOfPrecences = 0;

    var data = await _db
        .collection(jaar)
        .where('id', isEqualTo: widget.swimmerData.id)
        .get();

    for (var x in data.docs) {
      if (x.data()['aanwezig'] == true &&
          x.data()['groep'] == widget.swimmerData.groep) {
        numberOfPrecences++;
      }
    }

    return ChartData(data.docs.length, numberOfPrecences);
    // '${numberOfPrecences.toString()} / ${data.documents.length}';
  }
}
