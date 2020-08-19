import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/screens/edit_swimmer_screen.dart';
import 'package:mozka_2_app/widgets/toevoeg_scherm_widgets/add_screen_button.dart';
import 'package:mozka_2_app/root/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/modules/precences_database.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: BasicInfoCard(
                swimmerData: widget.swimmerData,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
              child: Text(
                'Groep Info',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GroupInfoCard(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
              child: Text(
                'Aanwezigheden Info',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PrecencesInfoCard(widget.swimmerData),
            ),
            SizedBox(
              height: 1000,
            ),
            AddScreenButton(
              text: 'Back',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            AddScreenButton(
              text: 'Update',
              onPressed: () async {
                var refresh = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => EditSwimmers(
                              swimmerData: widget.swimmerData,
                            )));
                setState(() {
                  refresh;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BasicInfoText extends StatelessWidget {
  final String text;
  final IconData icon;

  BasicInfoText({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.black45,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: kstyle,
          ),
        ],
      ),
    );
  }
}

class BasicInfoCard extends StatelessWidget {
  final SwimmerData swimmerData;

  BasicInfoCard({this.swimmerData});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '${swimmerData.voornaam.replaceFirst(swimmerData.voornaam[0], swimmerData.voornaam[0].toUpperCase())} ${swimmerData.achternaam.replaceFirst(swimmerData.achternaam[0], swimmerData.achternaam[0].toUpperCase())}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BasicInfoText(
              text: swimmerData.geboortejaar.toString(),
              icon: Icons.cake,
            ),
            BasicInfoText(
              text: swimmerData.geslacht,
              icon: swimmerData.geslacht == 'man'
                  ? FontAwesomeIcons.mars
                  : FontAwesomeIcons.venus,
            ),
            BasicInfoText(
              text: swimmerData.email != null ? swimmerData.email : 'leeg',
              icon: Icons.email,
            ),
          ],
        ),
      ),
    );
  }
}

class GroupInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Groep'),
            Text('begin datum groep'),
            Text('Groep'),
          ],
        ),
      ),
    );
  }
}

class PrecencesInfoCard extends StatelessWidget {
  final SwimmerData swimmerData;
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  PrecencesInfoCard(this.swimmerData);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream:
              fireBaseInterface.GetSwimmerPrecences(context, swimmerData.ID),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final messages = snapshot.data.documents;
            List<Text> messageWidgets = [];
            for (var message in messages) {
              final messageText = message.documentID;
              final messageWidget = Text('$messageText');
              messageWidgets.add(messageWidget);
            }
            return Column(
              children: messageWidgets,
            );
          },
        ),
      ),
    );
  }
}

Column aanlijst(List<PrecencesData> lijst) {
  List<Text> messageWidgets = [];
  for (var message in lijst) {
    final messageText = message.date;
    final messageWidget = Text('$messageText');
    messageWidgets.add(messageWidget);
  }
  return Column(
    children: messageWidgets,
  );
}
