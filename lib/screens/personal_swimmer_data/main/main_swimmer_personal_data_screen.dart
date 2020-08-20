import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/edit_swimmer_screen/main/main_edit_swimmer_screen.dart';
import 'package:mozka_2_app/root/constants.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data/widgets/basic_info_card.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data/widgets/group_info_card.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data/widgets/precences_info_card.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data/widgets/card_titles.dart';

class SwimmerPersonalDataScreen extends StatefulWidget {
  static const id = 'SwimmerPersonalData';
  final SwimmerData swimmerData;

  SwimmerPersonalDataScreen({this.swimmerData});

  @override
  _SwimmerPersonalDataScreenState createState() =>
      _SwimmerPersonalDataScreenState();
}

class _SwimmerPersonalDataScreenState extends State<SwimmerPersonalDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CircleAvatar(
                radius: 50.0,
                child: Text(
                  '${widget.swimmerData.voornaam[0].toUpperCase()}${widget.swimmerData.achternaam[0].toUpperCase()}',
                  style: TextStyle(fontSize: 45, color: kcircleAvatarTextColor),
                ),
              ),
            ),
            BasicInfoCard(
              swimmerData: widget.swimmerData,
            ),
            CardTitles(
              title: 'Groep Info',
            ),
            GroupInfoCard(),
            CardTitles(
              title: 'Aanwezigheden Info',
            ),
            PrecencesInfoCard(widget.swimmerData),
            SizedBox(
              height: 1000,
            ),
//            AddScreenButton(
//              text: 'Back',
//              onPressed: () {
//                Navigator.pop(context);
//              },
//            ),
//            AddScreenButton(
//              text: 'Update',
//              onPressed: () async {
//                var refresh = await Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (BuildContext context) => EditSwimmers(
//                              swimmerData: widget.swimmerData,
//                            )));
//                setState(() {
//                  refresh;
//                });
//              },
//            ),
          ],
        ),
      ),
    );
  }
}
