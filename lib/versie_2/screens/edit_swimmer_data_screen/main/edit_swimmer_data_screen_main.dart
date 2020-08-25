import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/screens/edit_swimmer_data_screen/widgets/custom_form.dart';

class EditSwimmerDataScreenMain extends StatelessWidget {
  static const String id = 'EditSwimmerDataScreenMain';
  SwimmerData2 swimmerData;

  EditSwimmerDataScreenMain({this.swimmerData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Toevoegen'),
      ),
      body: Container(
        child: CustomForm(
          swimmerData: swimmerData,
        ),
      ),
    );
  }
}
