import 'package:flutter/cupertino.dart';
import 'class_decoder_data.dart';
import 'package:provider/provider.dart';
import 'function_decoder_database.dart';

void DecodeCode(String trainingCode, BuildContext context) {
  //bools voor te kijken of voorwaarden voldaan zijn tijdens het decoderen
  bool afstand = true;
  bool set = false;
  bool oef = false;
  bool add = true;

  //maak de decoderdatabase leeg
  Provider.of<DecoderDatabase>(context, listen: false).ClearDecoderData();

  //var voor oefening op te slaan
  String afstandInMeters = '';
  String sets = '';
  String oefeningen = '';

  //loop die door de string van het textfield loopt en kijkt of er volgende voorwaarde voldaan zijn
  for (int index = 0; index < trainingCode.length; index++) {
    add = true;
    if (trainingCode[index] == ':') {
      set = true;
      afstand = false;
      oef = false;
      add = false;
    } else if (trainingCode[index] == '(') {
      if (sets == '') sets = '1';
      set = false;
      afstand = false;
      oef = true;
      add = false;
    } else if (trainingCode[index] == ')') {
      set = false;
      afstand = true;
      oef = false;
      add = false;

      //voeg oefening toe aan provider database
      Provider.of<DecoderDatabase>(context, listen: false).AddDecoderData(
          DecoderData(
              afstand: int.parse(afstandInMeters),
              sets: int.parse(sets),
              oefening: oefeningen,
              details: 'dsfsd'));

      //maak oefeningen var terug leeg
      afstandInMeters = '';
      sets = '';
      oefeningen = '';
    } else if (trainingCode[index] == '\n') {
      //print(code[index]);
      add = false;
    }

    //na het controleren van een char kijken of deze mag worden toegevoegd aan een oefeningen var
    if (add) {
      if (afstand) {
        afstandInMeters += trainingCode[index];
      } else if (set) {
        sets += trainingCode[index];
      } else if (oef) {
        oefeningen += trainingCode[index];
      }
    }
  }
}
