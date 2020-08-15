import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/test_test/testdata.dart';

class TestDatabase {
  final Firestore _firestore = Firestore.instance;

  Stream<List<TestData>> get testlist {
    return _firestore.collection('test').snapshots().map(
        (QuerySnapshot querySnapshot) => querySnapshot.documents
            .map((DocumentSnapshot documentSnapshot) =>
                TestData(name: documentSnapshot.data['naam']))
            .toList());
  }
}
