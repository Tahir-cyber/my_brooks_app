import 'package:brooks/views/CommercialRealEstateChecklist/CommercialRealEstateChecklistScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

final userId = FirebaseAuth.instance.currentUser!.uid;

class CorporateViewModel extends ChangeNotifier {
  bool loading = false;
  String? docIdd;

  uploadCorporateData(
      {required String name1,
      required String title1,
      required String ownerShip1,
      required String name2,
      required String title2,
      required String ownerShip2,
      required String name3,
      required String title3,
      required String ownerShip3,
      required String name4,
      required String title4,
      required String ownerShip4}) async {
    loading = true;
    notifyListeners();
    await FirebaseFirestore.instance.collection("Corporatescreen").add({
      "name1": name1,
      "title1": title1,
      "ownerShip1": ownerShip1,
      "name12": name2,
      "title2": title2,
      "ownerShip2": ownerShip2,
      "name3": name3,
      "title3": title3,
      "ownerShip3": ownerShip3,
      "name4": name4,
      "title4": title4,
      "ownerShip4": ownerShip4,
      "userId": userId,
    }).then((value) async {
      docIdd = value.id;
      FirebaseFirestore.instance
          .collection("Corporatescreen")
          .doc(docIdd)
          .update({
        "docId": docIdd,
      });
    }).then((value) => {Get.to(CommercialRealEstateChecklistScreen())});
    loading = false;
    notifyListeners();
  }
}
