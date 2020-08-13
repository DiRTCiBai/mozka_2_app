import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/aanwezigheden/listtile_swimmer.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';

class ListviewSwimmer extends StatefulWidget {
  final List<SwimmerData> swimmerDataList;
  ListviewSwimmer({this.swimmerDataList});

  @override
  _ListviewSwimmerState createState() => _ListviewSwimmerState();
}

class _ListviewSwimmerState extends State<ListviewSwimmer> {
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  List<SwimmerData> swimmerlist = [];
  @override
  void initState() {
    // TODO: implement initState
    swimmerlist = widget.swimmerDataList;
    for (var swimmer in swimmerlist) {
      swimmer.aanwezig = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTileSwimmer(
          swimmerData: swimmerlist[index],
          aanwezig: swimmerlist[index].aanwezig,
          onTap: () {
            setState(() {
              swimmerlist[index].aanwezig = !swimmerlist[index].aanwezig;
            });
          },
        );
      },
      itemCount: widget.swimmerDataList.length,
    );
  }
}
