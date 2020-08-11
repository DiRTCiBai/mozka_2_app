import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/swimmer_list/listtile_swimmer.dart';
import 'package:mozka_2_app/screens/swimmer_personal_data_screen.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';
import 'package:mozka_2_app/modules/allermessage.dart';

class ListviewSwimmer extends StatefulWidget {
  final List<SwimmerData> swimmerDataList;
  ListviewSwimmer({this.swimmerDataList});

  @override
  _ListviewSwimmerState createState() => _ListviewSwimmerState();
}

class _ListviewSwimmerState extends State<ListviewSwimmer> {
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  List<SwimmerData> swimmerDataList = [];

  @override
  void initState() {
    super.initState();
    swimmerDataList = widget.swimmerDataList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTileSwimmer(
          swimmerData: swimmerDataList[index],
          onLongPress: () async {
            bool delete = await DeleteSwimmerCheck(context);
            if (delete) {
              fireBaseInterface.DeleteSwimmer(swimmerDataList[index]);
              setState(() {
                swimmerDataList.remove(swimmerDataList[index]);
              });
            }
          },
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SwimmerPersonalDataScreen(
                    swimmerData: swimmerDataList[index],
                  ),
                ));
          },
        );
      },
      itemCount: swimmerDataList.length,
    );
  }
}
