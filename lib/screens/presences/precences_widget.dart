import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/root/constants.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.0,
      decoration: kstreamBuilderBoxDecoration,
      child: Container(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: StreamListView(),
      ),
    );
  }
}

class TopSheet extends StatelessWidget {
  final int listLength;

  TopSheet({this.listLength});

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
                    Text((swimlist != null) ? swimlist.length.toString() : '0'),
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

class StreamListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SwimmerData> swimlist = Provider.of<List<SwimmerData>>(context);
    return (swimlist != null)
        ? ListView.builder(
            itemBuilder: (context, index) {
              return ListTileSwimmer(
                swimmerData: (swimlist[index]),
                aanwezig: false,
                onTap: () {
                  print('oke');
                },
              );
              //return Text('${swimlist[index].voornaam}');
            },
            itemCount: swimlist.length,
          )
        : Text('loading');
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
