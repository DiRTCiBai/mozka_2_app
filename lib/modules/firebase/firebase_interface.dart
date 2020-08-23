import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mozka_2_app/modules/derest/swimmer_data.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/modules/firebase/functions/add_swimmers.dart';
import 'package:mozka_2_app/modules/firebase/functions/delete_swimmer.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/modules/firebase/functions/edit_swimmer.dart';
import 'file:///D:/AndroidstudioProjects/mozka_2_app/lib/modules/firebase/functions/get_swimmer_list.dart';
import 'package:mozka_2_app/modules/firebase/functions/add_precences.dart';
import 'package:mozka_2_app/modules/firebase/functions/test_document_exist.dart';
import 'package:mozka_2_app/modules/firebase/functions/delete_precences.dart';
import 'package:mozka_2_app/modules/firebase/functions/get_swimmer_precences.dart';
import 'package:mozka_2_app/modules/firebase/functions/get_precences_length.dart';
import 'package:mozka_2_app/modules/firebase/functions/get_total_precences_length.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data/widgets/precences_info_card.dart';
import 'package:mozka_2_app/modules/chartdata/properties.dart';
import 'package:mozka_2_app/modules/firebase/functions/get_precences_chart_data.dart';
import 'package:mozka_2_app/screens/personal_swimmer_data/functions/chartdata.dart';

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

  void AddPrecences(BuildContext context, String DocumentID) {
    FirebaseInterfaceAddPrecences(context, _db, DocumentID);
  }

  Future<bool> TestIfDocumentExist(String documentID) async {
    return FirebaseInterfaceTestIfDocumentExist(documentID, _db);
  }

  void DeletePrecences(String documentID) {
    FirebaseInterfaceDeletePrecences(documentID, _db);
  }

  //DocumentID = de zwemmer zijn id
  Stream GetSwimmerPrecences(BuildContext context, String DocumentID) {
    return FirebaseInterfaceGetSwimmerPrecences(context, DocumentID, _db);
  }

  //DocumentID = de zwemmer zijn id
  Future<int> GetPrecencesLength(String documentID) {
    return FirebaseInterfaceGetPrecencesLength(documentID, _db);
  }

  //DocumentID = de zwemmer zijn id
  Future<int> GetTotalPrecencesLength(String documentID) {
    return FirebaseInterfaceGetTotalPrecencesLength(documentID, _db);
  }

  Future<ChartData> GetPrecencesChartData(
      ChartDataProperties chartDataProperties) {
    return FirebaseInterfaceGetPrecencesChartData(chartDataProperties, _db);
  }
}
