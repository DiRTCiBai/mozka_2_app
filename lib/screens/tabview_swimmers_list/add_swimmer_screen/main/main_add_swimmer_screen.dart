import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/tabview_swimmers_list/add_swimmer_screen/widgets/form/custom_form.dart';

class MainAddSwimmerScreen extends StatelessWidget {
  static const String id = 'AddSwimmers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toevoegen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: MyCustomForm(),
    );
  }
}
