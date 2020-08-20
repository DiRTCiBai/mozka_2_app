import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_precences_screen/widgets/precences_listview_builder.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_precences_screen/functions/precences_funtions.dart';

class PrecencesScrollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PrecencesFunctions precencesFunctions =
        PrecencesFunctions(context: context);
    return Container(
      padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: StreamListView(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 60,
                child: GestureDetector(
                  onTap: () {
                    precencesFunctions.settingModalBottomSheet();
                  },
                  child: Card(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
