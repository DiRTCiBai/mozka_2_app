import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/data_swimmers.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/widgets/swimmer_list/tile_swimmers.dart';
import 'package:mozka_2_app/screens/individueel_data_swimmer.dart';

class SwimList extends StatefulWidget {
  final List<Swimmers> swimmers;
  SwimList({this.swimmers});

  @override
  _SwimListState createState() => _SwimListState();
}

class _SwimListState extends State<SwimList> {
  List<Swimmers> swimmers = [];

  @override
  void initState() {
    super.initState();
    swimmers = widget.swimmers;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return SwimmerTile(
          swimmer: swimmers[index],
          onTap: () {
            //ga naar persoonlijke info scherm
            //swimmers[index].PrintData();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SwimmerData(
                    swimmer: swimmers[index],
                  ),
                ));
          },
        );
      },
      itemCount: swimmers.length,
    );
  }
}
