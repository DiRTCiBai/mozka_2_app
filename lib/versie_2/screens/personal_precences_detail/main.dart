import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:flutter/material.dart';
import 'custom_futurebuiler_barchart.dart';
import 'custom_futurebuilder_barchart_groep.dart';

class PersonalPrecencesDetail extends StatelessWidget {
  static const String id = 'PersonalPrecencesDetail';
  final SwimmerData2 swimmerData;

  PersonalPrecencesDetail({this.swimmerData});

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
          SizedBox(
            width: double.infinity,
          ),
          CustomFutureBuilder(
            swimmerData: swimmerData,
          ),
          CustomFutureBuilderGroep(
            groep: 'f',
          ),
        ],
      ),
    );
  }
}
