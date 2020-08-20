import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/list_of_precences_screen/widgets/precences_listtile.dart';

class StreamListView extends StatefulWidget {
  @override
  _StreamListViewState createState() => _StreamListViewState();
}

class _StreamListViewState extends State<StreamListView> {
  bool aanwezig = false;
  @override
  Widget build(BuildContext context) {
    List<SwimmerData> swimlist = Provider.of<List<SwimmerData>>(context);
    return (swimlist != null)
        ? ListView.builder(
            itemBuilder: (context, index) {
              return ListTileSwimmer(
                swimmerData: (swimlist[index]),
                aanwezig: swimlist[index].aanwezig,
                onTap: () {
                  setState(() {
                    swimlist[index].aanwezig = !swimlist[index].aanwezig;
                  });
                },
              );
            },
            itemCount: swimlist.length,
          )
        : Text('loading');
  }
}
