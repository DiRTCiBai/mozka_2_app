import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/screens/add_comments_screen/main/add_comments_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/widgets/add_swimmers_list_tile.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/main/personal_swimmer_data_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/functions/delete_swimmer.dart';

class SwimmerListview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SwimmerData2> swimmerlist = Provider.of<List<SwimmerData2>>(context);

    return ListView.builder(
        itemBuilder: (context, index) {
          return ListTileSwimmer(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalSwimmerDataSCreenMain(
                    swimmerData: swimmerlist[index],
                  ),
                ),
              );
            },
            onLongPress: () {
              DeleteSwimmerFromFirestore(swimmerlist[index]);
            },
            onDoubleTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCommentsScreenMain(
                  swimmerData: swimmerlist[index],
                ),
              ),
            ),
            swimmerData: swimmerlist[index],
          );
        },
        itemCount: swimmerlist.length);
  }
}
