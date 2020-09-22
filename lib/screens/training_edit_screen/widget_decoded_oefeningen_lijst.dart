import 'package:flutter/material.dart';

List<Widget> GetList(
    List<String> oefening, List<int> meters, List<int> aantalSets) {
  if (oefening.length != 0) {
    List<Widget> list = [];

    int totaal = 0;
    for (int i = 0; i < oefening.length; i++) {
      totaal += meters[i];
      if (aantalSets[i] == 1) {
        list.add(Text('${meters[i]} ${oefening[i]}',
            style: TextStyle(fontSize: 25)));
      } else {
        list.add(Text('${meters[i]} ${aantalSets[i]}x ${oefening[i]}',
            style: TextStyle(fontSize: 25)));
      }
    }

    list.add(
      Text(
        '${totaal} Totaal',
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );

    return list;
  } else {
    List<Widget> list = [];
    list.add(Text('nog niks'));
    return list;
  }
}
