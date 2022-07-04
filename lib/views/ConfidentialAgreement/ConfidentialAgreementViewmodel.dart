import 'package:brooks/views/NON-EXCLUSIVE%20FEE%20AGREEMENT/Non_ExclusiveScreen.dart';
import 'package:brooks/views/ScheduleNo1Screen/AgreementDateWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfidentialAgreementViewmodel extends ChangeNotifier {
  bool loading = false;

  uploadDataToFirebase(
      {required String customerName, required String customerAddress}) async {
    loading = true;

    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection("LoanForm")
        .doc("${pref.getString("uid")}")
        .collection("confidentialAgreement")
        .add({
      "customerName": customerName,
      "customerAddress": customerAddress,
      "date": confidentialScreenDate
    }).then((value) {
      Get.to(NonExclusiveScreen());
    });
    loading = false;
    notifyListeners();
  }
}
