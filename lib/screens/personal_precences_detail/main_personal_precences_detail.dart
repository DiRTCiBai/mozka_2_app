import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/personal_precences_detail/total_precences/main_total_precences.dart';
import 'package:mozka_2_app/screens/personal_precences_detail/week_details/main_week_details.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/versie_2/screens/personal_precences_detail/bottom_nav.dart';
import 'widget_title.dart';

class PersonalPrecencesDetail extends StatelessWidget {
  static const String id = 'PersonalPrecencesDetail';
  final SwimmerData2 swimmerData;

  PersonalPrecencesDetail({this.swimmerData});

  static const double pad = 3.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Aanwezigheden Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: double.infinity),
          CustomPrecencesDetailTitle(title: 'Totaal aanwezigheden'),
          TotalPrecencesIndicator(swimmerData: swimmerData),
          Divider(),
          CustomPrecencesDetailTitle(title: 'Dag details'),
          DetailPrecencesTable(swimmerData: swimmerData),
          Divider(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
