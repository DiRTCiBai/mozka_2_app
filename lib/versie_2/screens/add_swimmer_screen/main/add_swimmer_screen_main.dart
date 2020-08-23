import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/screens/add_swimmer_screen/widgets/custom_form.dart';

class AddSwimmerScreenMain extends StatelessWidget {
  static const String id = 'AddSwimmerScreenMain';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('toevoegen'),
      ),
      body: Container(
        child: CustomForm(),
      ),
    );
  }
}
