import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mozka_2_app/modules/swimmer_data.dart';
import 'package:mozka_2_app/modules/aanwezigheden_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/modules/firebase/functions/add_swimmers.dart';
import 'package:mozka_2_app/modules/firebase/functions/delete_swimmer.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/modules/firebase/functions/edit_swimmer.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/modules/firebase/functions/get_swimmer_list.dart';
import 'package:mozka_2_app/modules/firebase/functions/add_precences.dart';
import 'package:mozka_2_app/modules/firebase/functions/test_document_exist.dart';
import 'package:mozka_2_app/modules/firebase/functions/delete_precences.dart';

class FireBaseInterface {
  Firestore _db = Firestore.instance;

  void AddSwimmer(SwimmerData swimmerData) {
    FirebaseInterfaceAddSwimmer(swimmerData, _db);
  }

  void DeleteSwimmer(SwimmerData swimmerData) {
    FirebaseInterfaceDeleteSwimmer(swimmerData, _db);
  }

  void EditSwimmer(SwimmerData swimmerData) {
    FirebaseInterfaceEditSwimmer(swimmerData, _db);
  }

  Future<dynamic> GetSwimmerData() async {
    return FirebaseInterfaceGetSwimmerData(_db);
  }

  void AddPrecences(List<PrecencesData> aanwezighedenList, String DocumentID) {
    FirebaseInterfaceAddPrecences(aanwezighedenList, _db, DocumentID);
  }

  Future<bool> TestIfDocumentExist(String documentID) async {
    return FirebaseInterfaceTestIfDocumentExist(documentID, _db);
  }

  void DeletePrecences(String documentID) {
    FirebaseInterfaceDeletePrecences(documentID, _db);
  }
}
