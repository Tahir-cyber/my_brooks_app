import 'dart:developer';

import 'package:brooks/views/CompanyInfo/companyinfoViewmodel.dart';
import 'package:brooks/views/Corporate/CorporateScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountRecievableInformationViewmodel extends ChangeNotifier {
  String value = "Goods";
  bool loading = false;

  changeValue(String value) {
    this.value = value;
    notifyListeners();
  }

  uploadAccountRecievableInformation(
      {required String recivableGeneratedSale,
      required String NoOfActiveCustomer,
      required String NumberOfInvPerMonth,
      required String normalSellingTime,
      required bool extendedTermsGranted,
      required String monthlyAverageSaleVoume,
      required String annualSale,
      required String monthlyBill,
      required bool purchaseOrderFromClient,
      required bool purchaseOrderFromClient2,
      required bool stillSubmittinginvoice,
      required String docReqFromCustomer,
      required String factorWith,
      required String reasonOfLeaving,
      required bool pendingLawSuit,
      required String lawSuitExplain,
      required bool outsatndingLoan,
      required String lenderAmount}) async {
    loading = true;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection("LoanForm")
        .doc("${pref.getString("uid")}")
        .collection("accountreceivableinformation")
        .add({
      "Receivables generated from sale of": recivableGeneratedSale,
      "Number of Active Customers:": NoOfActiveCustomer,
      "Number of invoices per month:": NumberOfInvPerMonth,
      "Normal Selling Terms (30, 60, 90 days)": normalSellingTime,
      "Are any extended terms granted?":
          extendedTermsGranted == true ? "Yes" : "No",
      "What is your Average Monthly Sales Volume?": monthlyAverageSaleVoume,
      "What are your Annual Sales \$ ": annualSale,
      "Your Monthly Billing do you wish to factor?": monthlyBill,
      "Do you require Purchase Orders from your Clients?":
          purchaseOrderFromClient == true ? "Yes" : "No",
      "Documentations do you require from your customers?": docReqFromCustomer,
      "Do you require Purchase Orders from your Clients ?":
          purchaseOrderFromClient2 == true ? "Yes" : "No",
      "With whom did you factor?": factorWith,
      "Are you still submitting invoices?":
          stillSubmittinginvoice == true ? "Yes" : "No",
      "What was your reason for leaving? ": reasonOfLeaving,
      "Any pending lawsuits against the Applicant or itsPrinciple(s)?":
          pendingLawSuit == true ? "Yes" : "No",
      "Please explain": lawSuitExplain,
      "Does the Applicant or its Principle(s) have any outstanding loans":
          outsatndingLoan == true ? "Yes" : "No",
      "List below the Lender Amount Outstanding Collateral": lenderAmount,
    }).then((value) {
      Get.to(CorporateScreen());
    });
    loading = false;
    notifyListeners();
    log("docid       >>>>>>>>>>>>>>>>>>>$docId");
  }
}
