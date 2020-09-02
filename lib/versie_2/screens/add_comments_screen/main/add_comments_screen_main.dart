import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/modules/time.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class AddCommentsScreenMain extends StatefulWidget {
  static const id = 'CommentsScreenMain';
  SwimmerData2 swimmerData;

  AddCommentsScreenMain({this.swimmerData});

  @override
  _AddCommentsScreenMainState createState() => _AddCommentsScreenMainState();
}

class _AddCommentsScreenMainState extends State<AddCommentsScreenMain> {
  String dropdownValue = 'One';
  final _formKey = GlobalKey<FormState>();
  String comment;
  String titel;
  String detailOpmerking = 'algemeen';

  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    GetCurrentUser();
  }

  void GetCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<SwimmerData2> swimmerlist = Provider.of<List<SwimmerData2>>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        title: Text('Toevoegen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchData(
                  list: swimmerlist,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 10, top: 20, right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DetailButton(
                      onTap: () {
                        setState(() {
                          detailOpmerking = 'benen';
                        });
                      },
                      selected: detailOpmerking == 'benen' ? true : false,
                      text: 'Benen',
                    ),
                    DetailButton(
                      text: 'Armen',
                      onTap: () {
                        setState(() {
                          detailOpmerking = 'Armen';
                        });
                      },
                      selected: detailOpmerking == 'Armen' ? true : false,
                    ),
                    DetailButton(
                      text: 'Hoofd',
                      onTap: () {
                        setState(() {
                          detailOpmerking = 'Hoofd';
                        });
                      },
                      selected: detailOpmerking == 'Hoofd' ? true : false,
                    ),
                    DetailButton(
                      text: 'Keerpunt',
                      onTap: () {
                        setState(() {
                          detailOpmerking = 'Keerpunt';
                        });
                      },
                      selected: detailOpmerking == 'Keerpunt' ? true : false,
                    ),
                    DetailButton(
                      text: 'Algemeen',
                      onTap: () {
                        setState(() {
                          detailOpmerking = 'Algemeen';
                        });
                      },
                      selected: detailOpmerking == 'Algemeen' ? true : false,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Container(
                  width: 375,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'titel',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (value) => titel = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 375,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Opmerking',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxLines: 15,
                    onSaved: (value) => comment = value,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 180),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      this._formKey.currentState.save();
                      print(comment);
                      FirebaseFirestore _db = FirebaseFirestore.instance;

                      _db.collection('opmerkingen').add({
                        'titel': titel,
                        'opmerking': comment,
                        'id': widget.swimmerData.id,
                        'datum': Time().GetDate(),
                        'detail': detailOpmerking,
                        'trainer': loggedInUser.email,
                      });

                      this._formKey.currentState.dispose();
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      color: Colors.blue,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                          child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool selected;

  DetailButton(
      {@required this.text, @required this.onTap, @required this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
          color: selected ? Colors.blue : Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 15, color: selected ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchData extends SearchDelegate<SwimmerData2> {
  final List<SwimmerData2> list;

  SearchData({this.list});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.account_circle),
      title: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<SwimmerData2> swimmerlist = Provider.of<List<SwimmerData2>>(context)
        .where((p) => p.voornaam.startsWith(query))
        .toList();
    final newlist =
//    query.isEmpty
//        ? recentlist
//        :
        list.where((p) => p.voornaam.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.pop(context);
          },
          title: Text(swimmerlist[index].voornaam),
        );
      },
      itemCount: swimmerlist.length,
    );
  }
}
