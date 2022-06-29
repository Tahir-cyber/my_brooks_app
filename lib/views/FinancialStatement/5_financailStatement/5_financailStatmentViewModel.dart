import 'package:brooks/views/FinancialStatement/6_financialstatement/6_FinancialStatementScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FinancialStatementViewModel5 extends ChangeNotifier {
  uploadData({required bool yesNo, required String PdfUrl}) async {
    await FirebaseFirestore.instance.collection("FinancialStatementPdf").add({
      "changes": yesNo == true ? "Yes" : "No",
      "PdfUrl": PdfUrl,
    }).then((value) {
      Get.to(FinancialStatementScreen_6());
    });
  }
}
