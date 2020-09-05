import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/precences_screen/functions/save_precences.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';

class PrecencesSaveButton extends StatelessWidget {
  List<SwimmerData2> swimmerlist;
  final Color color;
  final String groep;

  PrecencesSaveButton({this.swimmerlist, this.color, this.groep});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: FlatButton(
        onPressed: () {
          print('doet iets');
          SavePrecencesToFirestore(swimmerlist, groep);
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
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
