import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data/main/main_swimmer_personal_data_screen.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_swimmers_screen/functions/addlist_functions.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_swimmers_screen/widgets/addlist_listtile.dart';

class StreamListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AddListFunctions addListFunctions = AddListFunctions(context: context);

    List<SwimmerData> swimlist = Provider.of<List<SwimmerData>>(context);

    return (swimlist != null)
        ? ListView.builder(
            itemBuilder: (context, index) {
              return ListTileSwimmer(
                swimmerData: (swimlist[index]),
                onLongPress: () async {
                  addListFunctions.SettingModalBottomSheet(swimlist[index]);
                },
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SwimmerPersonalDataScreen(
                          swimmerData: swimlist[index],
                        ),
                      ));
                },
              );
            },
            itemCount: swimlist.length,
          )
        : Text('loading');
  }
}
