import 'package:flutter/material.dart';

import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'package:mozka_2_app/modules/firebase/firebase_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PrecencesInfoCard extends StatelessWidget {
  final SwimmerData swimmerData;
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  PrecencesInfoCard(this.swimmerData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
            stream:
                fireBaseInterface.GetSwimmerPrecences(context, swimmerData.ID),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              final messages = snapshot.data.documents;
              List<Text> messageWidgets = [];
              for (var message in messages) {
                final messageText = message.documentID;
                final messageWidget = Text('$messageText');
                messageWidgets.add(messageWidget);
              }
              return Column(
                children: messageWidgets,
              );
            },
          ),
        ),
      ),
    );
  }
}
