import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:flutter/material.dart';
import 'custom_futurebuiler_barchart.dart';
import 'custom_futurebuilder_barchart_groep.dart';

class PersonalPrecencesDetail extends StatefulWidget {
  static const String id = 'PersonalPrecencesDetail';
  final SwimmerData2 swimmerData;

  PersonalPrecencesDetail({this.swimmerData});

  @override
  _PersonalPrecencesDetailState createState() =>
      _PersonalPrecencesDetailState();
}

class _PersonalPrecencesDetailState extends State<PersonalPrecencesDetail> {
  String groep = 'f';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Aanwezigheden Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          CustomFutureBuilder(
            swimmerData: widget.swimmerData,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'f';
                    });
                  },
                  selected: groep == 'f' ? true : false,
                  text: 'F',
                ),
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'e';
                    });
                  },
                  selected: groep == 'e' ? true : false,
                  text: 'E',
                ),
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'd';
                    });
                  },
                  selected: groep == 'd' ? true : false,
                  text: 'D',
                ),
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'c';
                    });
                  },
                  selected: groep == 'c' ? true : false,
                  text: 'C',
                ),
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'b';
                    });
                  },
                  selected: groep == 'b' ? true : false,
                  text: 'B',
                ),
                FilterlButton(
                  onTap: () {
                    setState(() {
                      groep = 'a';
                    });
                  },
                  selected: groep == 'a' ? true : false,
                  text: 'A',
                ),
              ],
            ),
          ),
          CustomFutureBuilderGroep(
            groep: groep,
          ),
        ],
      ),
    );
  }
}

/***********************************WIDGETS************************************/
class FilterlButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool selected;

  FilterlButton(
      {@required this.text, @required this.onTap, @required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? Colors.blue : Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 20, color: selected ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
