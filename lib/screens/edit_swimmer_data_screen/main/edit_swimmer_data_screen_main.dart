import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/screens/edit_swimmer_data_screen/widgets/custom_form.dart';

class EditSwimmerDataScreenMain extends StatelessWidget {
  static const String id = 'EditSwimmerDataScreenMain';
  SwimmerData2 swimmerData;

  EditSwimmerDataScreenMain({this.swimmerData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Aanpassen'),
      ),
      body: Container(
        child: CustomForm(
          swimmerData: swimmerData,
        ),
      ),
    );
  }
}
