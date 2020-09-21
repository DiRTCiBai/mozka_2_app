import 'package:flutter/material.dart';
import 'file:///D:/AndroidstudioProjects/mozka_v2.1_app/lib/screens/add_swimmer_screen/widget_custom_form.dart';

class AddSwimmerScreenMain extends StatelessWidget {
  static const String id = 'AddSwimmerScreenMain';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Toevoegen'),
      ),
      body: Container(
        child: CustomForm(),
      ),
    );
  }
}
