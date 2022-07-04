import 'package:brooks/views/FinancialStatement/6_financialstatement/6_FinancialStatementScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinancialStatementViewModel5 extends ChangeNotifier {
  uploadData({required bool yesNo, required String PdfUrl}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection("LoanForm")
        .doc("${pref.getString("uid")}")
        .collection("FnCashIncomeAndExpendituresStament3")
        .add({
      "changes": yesNo == true ? "Yes" : "No",
      "PdfUrl": PdfUrl,
    }).then((value) {
      Get.to(FinancialStatementScreen_6());
    });
  }
}
