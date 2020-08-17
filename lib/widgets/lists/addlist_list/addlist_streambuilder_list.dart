import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/root/constants.dart';
import 'package:mozka_2_app/widgets/lists/addlist_list/addlist_listview_builder.dart';

class AddScrollList extends StatelessWidget {
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
