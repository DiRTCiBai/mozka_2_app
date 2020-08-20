import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'basic_info_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasicInfoCard extends StatelessWidget {
  final SwimmerData swimmerData;

  BasicInfoCard({this.swimmerData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
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
      ),
    );
  }
}
