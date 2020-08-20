import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_swimmers_screen/widgets/addlist_streambuilder_list.dart';

class MainListOfSwimmersScreen extends StatelessWidget {
  static const String id = 'MainListOfSwimmersScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
//          TopSheet(
//            title: 'Zwemmer lijst',
//          ),
//          //ScrollList(swimmerDataList),
          Expanded(
            child: AddScrollList(),
          ),
        ],
      ),
    );
  }
}
