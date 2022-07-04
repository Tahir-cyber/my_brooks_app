import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NonExclusiveFeeAgreementViewModel extends ChangeNotifier {
  bool loading = false;

  uploadDataTofirebase({
    required String firstPartyCompanyName,
    required String firstPartyAddress,
    required String firstPartyCity,
    required String firstPartyState,
    required String firstPartyZipCode,
    required String secondPartyName,
    required String secondPartyAddress,
    required String secondPartyCity,
    required String secondPartyState,
    required String secondPartyZipCode,
  }) async {
    loading = true;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection("LoanForm")
        .doc("${pref.getString("uid")}")
        .collection("nonExclusiveFeeAgreement")
        .add({
      "firstPartyCompanyName": firstPartyCompanyName,
      "firstPartyAddress": firstPartyAddress,
      "firstPartyCity": firstPartyCity,
      "firstPartyState": firstPartyState,
      "firstPartyZipCode": firstPartyZipCode,
      "secondPartyName": secondPartyName,
      "secondPartyAddress": secondPartyAddress,
      "secondPartyCity": secondPartyCity,
      "secondPartyState": secondPartyState,
      "secondPartyZipCode": secondPartyZipCode,
    }).then((value) {
      Get.to(ScheduleNo1Screen());
    });
    loading = false;
    notifyListeners();
  }
}
