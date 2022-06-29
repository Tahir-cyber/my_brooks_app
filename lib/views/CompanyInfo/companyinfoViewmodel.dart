import 'dart:developer';

import 'package:brooks/views/AccountsRecievableInformation/AccountsRecievableInformationScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

String? docId;

class ComapnyInfoViewModel extends ChangeNotifier {
  bool loading = false;
  uploadDataToFirebase({
    required String companyName,
    required String dba,
    required String contactPerson,
    required String address,
    required String phoneNumber,
    required String fax,
    required String email,
    required String typeOfBusiness,
    required String businessStartDate,
    required String stateOfIncorporation,
    required String numberOfEmployees,
    required String businessForm,
  }) async {
    loading = true;
    notifyListeners();

    await FirebaseFirestore.instance.collection("LoanForm").add({
      "companyName": companyName,
      "dba": dba,
      "contactPerson": contactPerson,
      "address": address,
      "phoneNumber": phoneNumber,
      "fax": fax,
      "email": email,
      "typeOfBusiness": typeOfBusiness,
      "businessStartDate": businessStartDate,
      "stateOfIncorporation": stateOfIncorporation,
      "numberOfEmployees": numberOfEmployees,
      "businessForm": businessForm,
    }).then((value) {
      log("Company Info Uploaded");
      docId = value.id;
      Get.to(AccountsRecievableInformationScreen());
    });
    loading = false;
    notifyListeners();
  }
}
