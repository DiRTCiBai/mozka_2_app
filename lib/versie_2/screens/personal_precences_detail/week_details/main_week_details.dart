import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:flutter/material.dart';
import 'function_percentage_week_days.dart';
import 'function_future_week_details.dart';
import 'constants.dart';
import 'widget_table_content.dart';

class DetailPrecencesTable extends StatelessWidget {
  PrecencesDetails precencesDetails = PrecencesDetails();
  final SwimmerData2 swimmerData;

  DetailPrecencesTable({this.swimmerData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: precencesDetails.DetailLijst(swimmerData),
        builder:
            (BuildContext context, AsyncSnapshot<NumberOfWeekdagen> snapshot) {
          if (snapshot.hasData) {
            List<double> dagen = snapshot.data.percentage;

            return Padding(
              padding: const EdgeInsets.all(kcardPadding),
              child: Table(
                columnWidths: {
                  0: kcolumn1Width,
                  1: kcolumn2Width,
                },
                //border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    CustomTableText(text: kdagen[0]),
                    CustomPercentageBar(percent: dagen[0]),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[1]),
                    CustomPercentageBar(percent: dagen[1]),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[2]),
                    CustomPercentageBar(percent: dagen[2]),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[3]),
                    CustomPercentageBar(percent: dagen[3]),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[4]),
                    CustomPercentageBar(percent: dagen[4]),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[5]),
                    CustomPercentageBar(percent: dagen[5]),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[6]),
                    CustomPercentageBar(percent: dagen[6]),
                  ]),
                ],
              ),
            );
          } else
            return CircularProgressIndicator();
        });
  }
}
