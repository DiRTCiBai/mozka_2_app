import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/constants/firestore_file_constants.dart';

Future<String> GetGoepInfo() async {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  String groepInfo = '';

  var groepDatabase =
      await _db.collection(kZwemmerFile).where('groep', isEqualTo: 'f').get();

  for (var groepData in groepDatabase.docs) {
    final String naam =
        groepData.data()['achternaam'] + ' ' + groepData.data()['voornaam'];
    final String email = groepData.data()['email'];
    groepInfo += ('$naam $email \n');
  }

  return groepInfo;
}
