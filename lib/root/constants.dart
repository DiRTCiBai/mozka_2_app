import 'package:flutter/material.dart';

//geslacht knoppen
const kactiveGenderColor = Colors.lightBlueAccent;
const kinactiveGenderColor = Colors.white;

//tile
const kmanColor = Colors.lightBlueAccent;
const kfemakeColor = Colors.pinkAccent;
const kcircleAvatarTextColor = Colors.white;

//add screen buttons
const kbuttonColor = Colors.white;
const kshadowColor = Color(0xFFb3bbc9);
const ktextColor = Colors.black;

const kstyle = TextStyle(fontSize: 20.0);

const kbottomsheetBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(30),
    topLeft: Radius.circular(30),
  ),
  color: Colors.white,
);

const kaanwezighedenButtonBoxDecoration = BoxDecoration(
  borderRadius:
      BorderRadius.all(Radius.circular(30)), //BorderRadius.circular(30),
  color: Colors.blue,
);

const kstreamBuilderBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
  color: Colors.blue,
);

const ktextFieldBoxDecoration = BoxDecoration(
  color: Color(0xFFDFDFDF),
  borderRadius: BorderRadius.all(
    Radius.circular(45.0),
  ),
);

const ksearchTextfieldDecoration = InputDecoration(
    border: InputBorder.none,
    icon: Icon(Icons.search),
    hintText: 'zoek zwemmer');
