import 'package:brooks/views/Corporate/corporateScreenViewmodel.dart';
import 'package:brooks/views/FinancialStatement/2_financialStatement/2_FinancialStatementScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinancialStatementViewModel1 extends ChangeNotifier {
  bool loading = false;
  String? docIdd;
  uploadFinancialStatementData(
      {required String applicantName,
      required String employeer,
      required String adressOfEmployeer,
      required String businessPhone,
      required String noOfYearWithEmployeer,
      required String position,
      required String nameOfPreviousEmployerAndPosition,
      required String noOfYearWithPreviousEmployer,
      required String homeAdress,
      required String homePhoneNo,
      required String socialSecurityNo,
      required String dateOfBirth,
      required String nameAndPhoneOfYourAccountant,
      required String nameAndPhoneOfYourAttorny,
      required String nameAndPhoneOfYourbroker,
      required String nameAndPhoneOfYourInsuranceAdvisor}) async {
    loading = true;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection("LoanForm")
        .doc("${pref.getString("uid")}")
        .collection("FnStamentPersInfo")
        .add({
      "applicantName": applicantName,
      "employeer": employeer,
      "adressOfEmployeer": adressOfEmployeer,
      "businessPhoneNo": businessPhone,
      "noOfYearWithEmployeer": noOfYearWithEmployeer,
      "titled/position": position,
      "nameOfPreviousEmployerAndPosition": nameOfPreviousEmployerAndPosition,
      "noOfYearWithPreviousEmployer": noOfYearWithPreviousEmployer,
      "homeAdress": homeAdress,
      "homePhoneNo": homePhoneNo,
      "socialSecurityNo": socialSecurityNo,
      "dateOfBirth": dateOfBirth,
      "nameAndPhoneOfYourAccountant": nameAndPhoneOfYourAccountant,
      "nameAndPhoneOfYourAttorny": nameAndPhoneOfYourAttorny,
      "nameAndPhoneOfYourbroker": nameAndPhoneOfYourbroker,
      "nameAndPhoneOfYourInsuranceAdvisor": nameAndPhoneOfYourInsuranceAdvisor,
      "userId": userId,
    }).then((value) {
      Get.to(FinancialStatementScreen_2());
    });
    loading = false;
    notifyListeners();
  }
}
