import 'package:brooks/views/ScheduleNo1Screen/AgreementDateWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SheduleNo1ScreenViewModel extends ChangeNotifier {
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
        .collection("sheduleNo1")
        .add({
      "date": sheduleScreenDate,
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
      Get.snackbar(
        "Success",
        "Data Uploaded Successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 4),
      );
    });
    loading = false;
    notifyListeners();
  }
}
