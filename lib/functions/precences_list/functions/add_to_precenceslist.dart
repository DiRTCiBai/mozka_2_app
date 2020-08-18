import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/modules/precences_database.dart';

void PrecencesListAddToPrecencesList(BuildContext context) {
  List<SwimmerData> swimlist =
      Provider.of<List<SwimmerData>>(context, listen: false);

  for (var swimmer in swimlist) {
    if (swimmer.aanwezig) {
      PrecencesData precencesData = PrecencesData(id: swimmer.ID);
      Provider.of<PrecencesDatabase>(context, listen: false)
          .AddToList(precencesData);
    }
  }
}
