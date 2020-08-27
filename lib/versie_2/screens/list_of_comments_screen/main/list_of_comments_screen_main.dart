import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_comments_screen/widgets/get_comments.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';

class ListOfCommentsMain extends StatelessWidget {
  static const String id = 'ListOfCommentsMain';

  SwimmerData2 swimmerData;

  ListOfCommentsMain({this.swimmerData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Opmerkingen'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetComments(
          swimmerData: swimmerData,
        ),
      ),
    );
  }
}
