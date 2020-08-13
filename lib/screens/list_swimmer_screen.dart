import 'package:flutter/material.dart';
import 'package:mozka_2_app/screens/add_swimmer_screen.dart';
import 'package:mozka_2_app/widgets/swimmer_list/streambuilder_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';
import 'package:mozka_2_app/modules/firebase_interface.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';

class SwimmersList extends StatefulWidget {
  static const String id = 'SwimmersList';

  @override
  _SwimmersListState createState() => _SwimmersListState();
}

class _SwimmersListState extends State<SwimmersList> {
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
        child: Icon(Icons.add),
        onPressed: () async {
          final refresh = await Navigator.pushNamed(context, AddSwimmers.id);
          setState(() {
            refresh;
          });
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
                        'Zwemmers',
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
                child: StreamBuilderListView(),
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
}
