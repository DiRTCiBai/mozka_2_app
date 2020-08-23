import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/widgets/add_swimmers_list_tile.dart';
import 'package:mozka_2_app/versie_2/screens/list_of_swimmers_screen/functions/swimmer_list_stream.dart';

class ListOfSwimmersScreenMain extends StatelessWidget {
  static const String id = 'ListOfSwimmersScreenMain';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('lijst'),
      ),
      body: StreamBuilder(
          stream: GetSwimmerData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTileSwimmer(
                      onTap: () {
                        //ga naar persoonlijke data scherm
                      },
                      onLongPress: () {
                        //verwijder zwemmer
                      },
                      swimmerData: snapshot.data[index],
                    );
                  },
                  itemCount: snapshot.data.length);
            } else {
              return Text('loading');
            }
          }),
    );
  }
}
