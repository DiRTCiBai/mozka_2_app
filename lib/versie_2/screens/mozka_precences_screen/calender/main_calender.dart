import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/versie_2/modules/time.dart';
import 'widget_button.dart';
import 'widget_filter_button.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/modules/filter_database.dart';

const ktextStyleIndex =
    TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey);
const ktextStyleNaam = TextStyle(fontSize: 25, fontWeight: FontWeight.w500);

class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  String _date;
  String _datum;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Button(
              text: _date == null
                  ? 'Seleteer datum'
                  : _date.replaceRange(10, 23, ''),
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2222))
                    .then((date) {
                  setState(() {
                    _datum = date.day.toString() +
                        date.month.toString() +
                        date.year.toString();
                    _date = date.toString();
                  });
                });
              },
            ),
            GroepFilter(),
            PrecencesCalender(
              groep: Provider.of<FilterDatabase>(context).GetFilter(),
              datum: _datum,
            ),
          ],
        ),
      ),
    );
  }
}

class PrecencesCalender extends StatelessWidget {
  final String groep;
  final String datum;

  PrecencesCalender({this.groep, this.datum});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: GetPrecences(datum, groep),
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            List<ListTile> list = [];

            if (snapshot.hasData) {
              for (int index = 0; index < snapshot.data.length; index++) {
                list.add(ListTile(
                  leading: Text('${index + 1}', style: ktextStyleIndex),
                  title: Text('${snapshot.data[index]}', style: ktextStyleNaam),
                ));
              }

              return ListView(
                children: list,
              );
            } else
              return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<List<String>> GetPrecences(String datum, String groep) async {
    FirebaseFirestore _db = FirebaseFirestore.instance;
    List<String> aanwezighedenLijst = [];

    if (datum != null) {
      var aanwezigheden = await _db
          .collection('${Time().GetYear()}test')
          .where('datum', isEqualTo: datum)
          .get();

      for (var data in aanwezigheden.docs) {
        if (data.data()['groep'] == groep && data.data()['aanwezig']) {
          aanwezighedenLijst.add('${data.data()['naam']}');
        }
      }
    }

    return aanwezighedenLijst;
  }
}
