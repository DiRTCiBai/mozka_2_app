import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/screens/swimmer_personal_data_screen.dart';
import 'package:mozka_2_app/widgets/lists/addlist_list/addlist_listtile.dart';
import 'package:mozka_2_app/functions/addlist/addlist_functions.dart';

FireBaseInterface fireBaseInterface = FireBaseInterface();

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
              //return Text('${swimlist[index].voornaam}');
            },
            itemCount: swimlist.length,
          )
        : Text('loading');
  }
}
