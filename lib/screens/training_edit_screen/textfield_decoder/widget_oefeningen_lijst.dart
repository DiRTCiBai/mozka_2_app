import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'function_decoder_database.dart';
import 'class_decoder_data.dart';

List<Widget> GetList(BuildContext context) {
  List<DecoderData> decoderData =
      Provider.of<DecoderDatabase>(context).GetDecoderData();

  /*als decoderdata leef is return text(niks)
  * als decoderdata data bevat zal er een lijst van widgets gemaakt worden.*/
  if (decoderData.length != 0) {
    List<Widget> list = [];

    int totaal = 0;
    for (int i = 0; i < decoderData.length; i++) {
      totaal += decoderData[i].afstand;
      if (decoderData[i].sets == 1) {
        list.add(Text('${decoderData[i].afstand} ${decoderData[i].oefening}',
            style: TextStyle(fontSize: 25)));
      } else {
        list.add(Text(
            '${decoderData[i].afstand} ${decoderData[i].sets}x ${decoderData[i].oefening}',
            style: TextStyle(fontSize: 25)));
      }
    }

    //voeg op het einde nog totale afstand toe
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
