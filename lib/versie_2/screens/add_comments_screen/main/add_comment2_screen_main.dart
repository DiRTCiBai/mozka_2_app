import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mozka_2_app/versie_2/modules/swimmer_data.dart';
import 'package:mozka_2_app/versie_2/modules/time.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:mozka_2_app/versie_2/screens/add_comments_screen/functions/search_data_comments.dart';
import 'package:mozka_2_app/versie_2/screens/add_comments_screen/widgets/detail_button.dart';
import 'package:mozka_2_app/versie_2/screens/add_comments_screen/functions/get_current_user.dart';
import 'package:mozka_2_app/versie_2/screens/add_comments_screen/widgets/custom_save_button.dart';
import 'package:mozka_2_app/versie_2/screens/add_comments_screen/widgets/custom_formfield.dart';

class AddCommentsScreenMain2 extends StatefulWidget {
  static const id = 'AddCommentsScreenMain2';
  SwimmerData2 swimmerData;

  AddCommentsScreenMain2({this.swimmerData});

  @override
  _AddCommentsScreenMain2State createState() => _AddCommentsScreenMain2State();
}

class _AddCommentsScreenMain2State extends State<AddCommentsScreenMain2> {
  final _formKey = GlobalKey<FormState>();
  User loggedInUser;

  String comment;
  String titel;
  String detailOpmerking = 'algemeen';

  String swimmerID;
  String swimmerName;

  @override
  void initState() {
    super.initState();
    GetUser();
  }

  void GetUser() async {
    loggedInUser = await GetCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    List<SwimmerData2> swimmerlist = Provider.of<List<SwimmerData2>>(context);
    SearchSwimmerListComments searchData =
        SearchSwimmerListComments(list: swimmerlist);

    void GetName() async {
      var swimmer = await showSearch(context: context, delegate: searchData);
      swimmerID = swimmer.id;

      setState(() => swimmerName = swimmer.voornaam);
    }

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
              GetName();
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
                  child: Text(swimmerName == null
                      ? 'nog niks geselecteerd'
                      : swimmerName),
                ),
              ),
              CustomFormField(
                onSaved: (value) => titel = value,
                hintText: 'Titel',
                maxLines: 1,
              ),
              CustomFormField(
                onSaved: (value) => comment = value,
                hintText: 'Opmerking',
                maxLines: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      if (swimmerID != null) {
                        this._formKey.currentState.save();
                        print(comment);
                        FirebaseFirestore _db = FirebaseFirestore.instance;

                        _db.collection('opmerkingen').add({
                          'titel': titel,
                          'opmerking': comment,
                          'id': swimmerID,
                          'datum': Time().GetDate(),
                          'detail': detailOpmerking,
                          'trainer': loggedInUser.email,
                        });

                        this._formKey.currentState.dispose();
                        Navigator.pop(context);
                      } else {
                        print('kies zwemmer');
                      }
                    }
                  },
                  child: CustomSaveButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
