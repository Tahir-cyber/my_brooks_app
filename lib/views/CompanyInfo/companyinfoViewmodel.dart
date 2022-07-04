import 'package:brooks/Models/user_model.dart';
import 'package:brooks/views/AccountsRecievableInformation/AccountsRecievableInformationScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? docId;

class ComapnyInfoViewModel extends ChangeNotifier {
  UserModel loggedInUser = UserModel();
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
    SharedPreferences pref = await SharedPreferences.getInstance();
    loading = true;
    notifyListeners();

    await FirebaseFirestore.instance
        .collection("LoanForm")
        .doc("${pref.getString("uid")}")
        .set({
      "name": pref.getString("name"),
      "email": pref.getString("email"),
      "userId": pref.getString("uid"),
    }).then((value) async {
      await FirebaseFirestore.instance
          .collection("LoanForm")
          .doc("${pref.getString("uid")}")
          .collection("companyInformation")
          .add({
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
      });

      Get.to(AccountsRecievableInformationScreen());
    });
    loading = false;
    notifyListeners();
  }
}
