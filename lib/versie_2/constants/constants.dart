import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String kSaveSwimmerDataId = 'zwemmers';

const List<BottomNavigationBarItem> kBottomNav = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    title: Text('Home'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.list),
    title: Text('Zwemmers'),
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.timer),
    title: Text('Training'),
  ),
];

//groep filter
const kGroepPre = "pre";
const kGroepF = "f";
const kGroepE = "e";
const kGroepD = "d";
const kGroepC = "c";
const kGroepB = "b";
const kGroepA = "a";
const kGroepAlle = "alle";

const kTextPre = 'P';
