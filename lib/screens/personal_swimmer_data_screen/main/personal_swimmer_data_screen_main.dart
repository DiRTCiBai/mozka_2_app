import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data_screen/widgets/basic_info_card.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data_screen/widgets/bottom_nav_bar.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data_screen/widgets/custom_drawer.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data_screen/widgets/group_info_card.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/constants.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data_screen/widgets/werkpunt_info_card.dart';

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
      ),
      body: ListView(
        children: <Widget>[
          Column(
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
              BasicInfoCard(swimmerData: widget.swimmerData),
              VooruitgangInfoCard(swimmerData: widget.swimmerData),
              WerkpuntInfoCard(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
