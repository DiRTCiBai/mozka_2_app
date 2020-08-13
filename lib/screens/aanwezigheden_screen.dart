import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';
import 'package:mozka_2_app/screens/start_screen.dart';
import 'package:mozka_2_app/widgets/aanwezigheden/streambuilder_listview.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';

class AanwezighedenScreen extends StatefulWidget {
  static const String id = 'aanwezigheden';

  @override
  _AanwezighedenScreenState createState() => _AanwezighedenScreenState();
}

class _AanwezighedenScreenState extends State<AanwezighedenScreen> {
  int _currentIndex = 1;
  int swimmerListLength = 0;
  FireBaseInterface fireBaseInterface = FireBaseInterface();
  List<SwimmerData> swimmerDataList = [];
  List<Aanwezighedendata> aawezighedenList = [];
  @override
  void initState() {
    GetListLength();
    super.initState();
  }

  Future<void> GetListLength() async {
    swimmerListLength = await fireBaseInterface.GetSwimmerDataLength();
    setState(() {
      swimmerListLength;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.blue,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () {
//          for (var test in swimmerDataList) {
//            if (test.aanwezig) {
//              Aanwezighedendata aanwezighedendata =
//                  Aanwezighedendata(id: test.ID, aanwezig: test.aanwezig);
//              aawezighedenList.add(aanwezighedendata);
//            }
//          }
//          fireBaseInterface.AddAanwezigheden(aawezighedenList);
//          Navigator.pop(context);
          _settingModalBottomSheet(context);
        },
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Aanwezigheden',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 3, bottom: 3, left: 6, right: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.group),
                            SizedBox(
                              width: 5,
                            ),
                            Text(swimmerListLength.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFDFDFDF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(45.0),
                      ),
                    ),
                    child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.search),
                            hintText: 'zoek zwemmer')),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Container(
              height: 600.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                child: StreamBuilderListViewAanwezigheden(
                  swimmerDataList: swimmerDataList,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        fixedColor: Colors.teal,
        items: [
          BottomNavigationBarItem(
            title: Text("Home"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Search"),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text("Add"),
            icon: Icon(Icons.add_box),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _currentIndex = index;

            if (_currentIndex == 0) {
              Navigator.pop(context);
            }
          });
        },
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Color(0xFF757575),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'wil je opslaan ?',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 15,
                ),
                FlatButton(
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    for (var test in swimmerDataList) {
                      if (test.aanwezig) {
                        Aanwezighedendata aanwezighedendata = Aanwezighedendata(
                            id: test.ID, aanwezig: test.aanwezig);
                        aawezighedenList.add(aanwezighedendata);
                      }
                    }
                    if (aawezighedenList.length != 0) {
                      fireBaseInterface.AddAanwezigheden(aawezighedenList);
                      aawezighedenList.clear();
                    }
                    Navigator.popUntil(
                        context, ModalRoute.withName(StartScreen.id));
                  },
                ),
                FlatButton(
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    print('save aanweziheid data');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
