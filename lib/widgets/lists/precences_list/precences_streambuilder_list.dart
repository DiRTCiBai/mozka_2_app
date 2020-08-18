import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/root/constants.dart';
import 'package:mozka_2_app/widgets/lists/precences_list/precences_listview_builder.dart';
import 'package:mozka_2_app/functions/precences_list/precences_funtions.dart';

class PrecencesScrollList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PrecencesFunctions precencesFunctions =
        PrecencesFunctions(context: context);
    return Container(
      height: 600.0,
      decoration: kstreamBuilderBoxDecoration,
      child: Container(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamListView(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    precencesFunctions.SettingModalBottomSheet();
                  },
                  child: Card(
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
