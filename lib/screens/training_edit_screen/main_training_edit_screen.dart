import 'package:flutter/material.dart';
import 'widget_textfield.dart';

class MainTrainingEditScreen extends StatefulWidget {
  static const String id = 'MainTrainingEditScreen';
  final String training;
  final String trainingId;

  MainTrainingEditScreen({this.training, this.trainingId});

  @override
  _MainTrainingEditScreenState createState() => _MainTrainingEditScreenState();
}

class _MainTrainingEditScreenState extends State<MainTrainingEditScreen> {
  final _controller = TextEditingController();

  void initState() {
    super.initState();
    //zet training in begin tekst van texfield
    _controller.text = widget.training;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bewerk training'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      //widget waar code int textfield wordt gegschreven en gedecodeerd
      body: EditTextField(
        controler: _controller,
        trainingId: widget.trainingId,
      ),
    );
  }
}
