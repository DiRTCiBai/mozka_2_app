import 'package:flutter/material.dart';
import 'package:mozka_2_app/constants.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/widgets/aanwezigheden/streambuilder_listview.dart';

class AanwezighedenButton extends StatelessWidget {
  final String displayText;
  final Function onPressed;

  AanwezighedenButton({@required this.displayText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        width: 150,
        decoration: kaanwezighedenButtonBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Center(
            child: Text(
              displayText,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class ScrollList extends StatelessWidget {
  List<SwimmerData> swimmerDataList = [];

  ScrollList(this.swimmerDataList);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      decoration: kstreamBuilderBoxDecoration,
      child: Container(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: StreamBuilderListViewAanwezigheden(
          swimmerDataList: swimmerDataList,
        ),
      ),
    );
  }
}

class TopSheet extends StatelessWidget {
  final int listLength;

  TopSheet({this.listLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Aanwezigheden',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 3, bottom: 3, left: 6, right: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.group),
                    SizedBox(
                      width: 5,
                    ),
                    Text(listLength.toString()),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            decoration: ktextFieldBoxDecoration,
            child: TextField(
              decoration: ksearchTextfieldDecoration,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
