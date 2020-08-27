import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/functions/save_precences.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';

class PrecencesSaveButton extends StatelessWidget {
  List<SwimmerData2> swimmerlist;

  PrecencesSaveButton({this.swimmerlist});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: FlatButton(
        onPressed: () {
          print('doet iets');
          SavePrecencesToFirestore(swimmerlist);
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
          child: Center(
              child: Text(
            'Opslaan',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          )),
        ),
      ),
    );
  }
}
