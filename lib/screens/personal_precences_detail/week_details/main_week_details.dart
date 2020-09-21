import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
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
            List<int> aanwezigheden = snapshot.data.aanwezigheden;
            List<int> totaal = snapshot.data.totaleAanwezigheden;

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
                    CustomPercentageBar(
                      percent: dagen[0],
                      aawezig: aanwezigheden[0],
                      totaal: totaal[0],
                    ),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[1]),
                    CustomPercentageBar(
                      percent: dagen[1],
                      aawezig: aanwezigheden[1],
                      totaal: totaal[1],
                    ),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[2]),
                    CustomPercentageBar(
                      percent: dagen[2],
                      aawezig: aanwezigheden[2],
                      totaal: totaal[2],
                    ),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[3]),
                    CustomPercentageBar(
                      percent: dagen[3],
                      aawezig: aanwezigheden[3],
                      totaal: totaal[3],
                    ),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[4]),
                    CustomPercentageBar(
                      percent: dagen[4],
                      aawezig: aanwezigheden[4],
                      totaal: totaal[4],
                    ),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[5]),
                    CustomPercentageBar(
                      percent: dagen[5],
                      aawezig: aanwezigheden[5],
                      totaal: totaal[5],
                    ),
                  ]),
                  TableRow(children: [
                    CustomTableText(text: kdagen[6]),
                    CustomPercentageBar(
                      percent: dagen[6],
                      aawezig: aanwezigheden[6],
                      totaal: totaal[6],
                    ),
                  ]),
                ],
              ),
            );
          } else
            return CircularProgressIndicator();
        });
  }
}
