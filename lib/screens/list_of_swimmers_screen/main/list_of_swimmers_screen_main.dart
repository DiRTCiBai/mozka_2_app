import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/list_of_swimmers_screen/widgets/bottom_nav_bar.dart';
import 'package:mozka_2_app/screens/list_of_swimmers_screen/widgets/swimmer_listview.dart';
import 'package:mozka_2_app/screens/list_of_swimmers_screen/widgets/list_add_button.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/screens/list_of_swimmers_screen/functions/search_data_class.dart';
import 'package:mozka_2_app/screens/list_of_swimmers_screen/widgets/filter_button.dart';
import 'package:mozka_2_app/modules/filter_database.dart';
import 'groep_filter/main_groep_filter.dart';

class ListOfSwimmersScreenMain extends StatefulWidget {
  static const String id = 'ListOfSwimmersScreenMain';

  @override
  _ListOfSwimmersScreenMainState createState() =>
      _ListOfSwimmersScreenMainState();
}

class _ListOfSwimmersScreenMainState extends State<ListOfSwimmersScreenMain> {
  double _filterMargin = 10;

  @override
  Widget build(BuildContext context) {
    List<SwimmerData2> swimmerlist = Provider.of<List<SwimmerData2>>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('lijst'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchSwimmerList(
                  list: swimmerlist,
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(_filterMargin),
            child: MainGroepFilter(),
          ),
          Expanded(
            child: SwimmerListview(
              groep: Provider.of<FilterDatabase>(context).GetFilter(),
            ),
          ),
          ListAddButton(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigatorBar(),
    );
  }
}
