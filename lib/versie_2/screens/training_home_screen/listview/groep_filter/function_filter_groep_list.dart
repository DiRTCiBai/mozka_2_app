import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/trainingen.dart';
import 'package:provider/provider.dart';

List<Trainingen> GetGroepList(String groep, List<Trainingen> trainingenlist) {
  List<Trainingen> filterList = [];

  if (groep != null) {
    for (var training in trainingenlist) {
      if (training.groep == groep) {
        filterList.add(training);
      }
    }
    return filterList;
  } else {
    return trainingenlist;
  }
}
