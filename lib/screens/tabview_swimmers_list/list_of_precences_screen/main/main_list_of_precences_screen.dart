import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/widgets/lists/topsheet.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_precences_screen/widgets/precences_streambuilder_list.dart';

class MainListOfPrecencesScreen extends StatelessWidget {
  static const String id = 'MainListOfPrecencesScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
//          TopSheet(
//            title: 'Aanwezigheden',
//          ),
          //ScrollList(swimmerDataList),
          Expanded(child: PrecencesScrollList()),
        ],
      ),
    );
  }
}
