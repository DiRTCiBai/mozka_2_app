import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/screens/add_comments_screen/main/add_comments_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/widgets/add_swimmers_list_tile.dart';
import 'package:mozka_2_app/versie_2/screens/personal_swimmer_data_screen/main/personal_swimmer_data_screen_main.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/functions/delete_swimmer.dart';
import 'package:mozka_2_app/versie_2/modules/groep_filter/function_groep_filter.dart';

class SwimmerListview extends StatefulWidget {
  final String groep;

  SwimmerListview({this.groep});

  @override
  _SwimmerListviewState createState() => _SwimmerListviewState();
}

class _SwimmerListviewState extends State<SwimmerListview> {
  @override
  Widget build(BuildContext context) {
    List<SwimmerData2> swimmerlist = Provider.of<List<SwimmerData2>>(context);

    return swimmerlist == null
        ? CircularProgressIndicator
        : ListView.builder(
            itemBuilder: (context, index) {
              var swimmers =
                  FilterSwimmerList(widget.groep, swimmerlist)[index];
              return ListTileSwimmer(
                swimmerData: swimmers,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalSwimmerDataSCreenMain(
                        swimmerData: swimmers,
                      ),
                    ),
                  );
                },
                onLongPress: () {
                  DeleteSwimmerFromFirestore(swimmers);
                },
                onDoubleTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCommentsScreenMain(
                      swimmerData: swimmers,
                    ),
                  ),
                ),
              );
            },
            itemCount: FilterSwimmerList(widget.groep, swimmerlist).length,
          );
  }
}
