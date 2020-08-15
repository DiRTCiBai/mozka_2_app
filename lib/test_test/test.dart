import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/root/constants.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/test_test/testdata.dart';

class TestScreen extends StatelessWidget {
  static const String id = 'testscreen';

  @override
  Widget build(BuildContext context) {
    List<TestData> swimmlist = Provider.of<List<TestData>>(context);
    return Scaffold(
      body: SafeArea(
        child: (swimmlist != null)
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Text(swimmlist[index].name);
                },
                itemCount: swimmlist.length,
              )
            : Text('loading'),
      ),
    );
  }
}

class ListTileSwimmer extends StatelessWidget {
  final SwimmerData swimmerData;
  final Function onTap;
  final bool aanwezig;

  ListTileSwimmer({this.onTap, this.swimmerData, this.aanwezig});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: aanwezig ? Colors.lightGreenAccent : Colors.white,
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor:
                swimmerData.geslacht == 'man' ? kmanColor : kfemakeColor,
            child: Text(
              '${swimmerData.voornaam[0].toUpperCase()}${swimmerData.achternaam[0].toUpperCase()}',
              style: TextStyle(color: kcircleAvatarTextColor),
            ),
          ),
          title: Text(
            '${swimmerData.voornaam} ${swimmerData.achternaam}',
            style: TextStyle(fontSize: 25.0),
          ),
          trailing: Icon(Icons.more_vert),
        ),
      ),
    );
  }
}
