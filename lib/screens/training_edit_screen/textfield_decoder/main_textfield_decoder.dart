import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/widget_button.dart';
import 'package:provider/provider.dart';
import 'function_decoder_database.dart';
import 'function_decode_training.dart';
import 'widget_oefeningen_lijst.dart';
import 'function_update_training.dart';

class EditTextField extends StatefulWidget {
  final TextEditingController controler;
  final String trainingId;

  EditTextField({@required this.controler, @required this.trainingId});

  @override
  _EditTextFieldState createState() => _EditTextFieldState();
}

class _EditTextFieldState extends State<EditTextField> {
  String code;

  @override
  void initState() {
    super.initState();
    //zet in het begin de tekst van het textfield gelijk aan text uit de training
    code = widget.controler.text;
    //decode de string code en zet dit om in preview
    DecodeCode(code, context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //textfield waar alle tekst in wordt geschreven
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: widget.controler,
            style: TextStyle(
              fontSize: 25,
            ),
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(),
            onChanged: (value) {
              code = value;
              DecodeCode(code, context);
            },
          ),
        ),
        //training oefeningen preview
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              children: GetList(context),
            ),
          ),
        ),
        //knop voor training te updaten
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Button(
            text: 'Update',
            color: Colors.blue,
            onTap: () {
              UpdateTraining(
                  code,
                  Provider.of<DecoderDatabase>(context, listen: false)
                      .GetTotAfstand(),
                  widget.trainingId);
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
