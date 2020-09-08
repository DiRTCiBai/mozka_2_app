import 'package:flutter/material.dart';
import 'custom_futurebuilder_barchart_groep.dart';

class MozkaPrecencesScreen extends StatelessWidget {
  static const String id = 'MozkaPrecencesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Aanwezigheden'),
      ),
      body: CustomFutureBuilderGroep(),
    );
  }
}
