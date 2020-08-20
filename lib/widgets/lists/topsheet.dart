import 'package:flutter/material.dart';
import 'package:mozka_2_app/root/constants.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:provider/provider.dart';

class TopSheet extends StatelessWidget {
  final String title;

  TopSheet({@required this.title});

  @override
  Widget build(BuildContext context) {
    List<SwimmerData> swimlist = Provider.of<List<SwimmerData>>(context);
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 3, bottom: 3, left: 6, right: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.blue,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      (swimlist != null) ? swimlist.length.toString() : '0',
                      style: TextStyle(color: Colors.white),
                    ),
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
