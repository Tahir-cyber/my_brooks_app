import 'package:brooks/views/Corporate/corporateScreenViewmodel.dart';
import 'package:brooks/views/FinancialStatement/5_financailStatement/5_FinancialStatementScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FinancialStatementViewModel4 extends ChangeNotifier {
  bool loading = false;

  uploadData({
    required String fedralIncome,
    required String StateIncome,
    required String propertyTax,
    required String MortgagePrinciple,
    required String MortgageInterest,
    required String installment,
    required String insurance,
    required String investment,
    required String iraAndOtherExpenses,
    required String tutionaChildDayCareExpen,
    required String otherLivingExpenses,
    required String medicalAndDentalExpenses,
    required String otherExpensesList,
    required String totalExpenditure,
  }) async {
    loading = true;
    notifyListeners();
    await FirebaseFirestore.instance.collection("FinStatBalanceSheet2").add({
      "fedralIncome": fedralIncome,
      "StateIncome": StateIncome,
      "propertyTax": propertyTax,
      "MortgagePrinciple": MortgagePrinciple,
      "MortgageInterest": MortgageInterest,
      "installment": installment,
      "insurance": insurance,
      "investment": investment,
      "iraAndOtherExpenses": iraAndOtherExpenses,
      "tutionaChildDayCareExpen": tutionaChildDayCareExpen,
      "otherLivingExpenses": otherLivingExpenses,
      "medicalAndDentalExpenses": medicalAndDentalExpenses,
      "otherExpensesList": otherExpensesList,
      "totalExpenditure": totalExpenditure,
      "userId": userId,
    }).then((value) async {
      await FirebaseFirestore.instance
          .collection("FinStatBalanceSheet2")
          .doc(value.id)
          .update({
        "docId": value.id,
      });
    }).then((value) {
      Get.to(FinancialStatementScreen_5());
    });
    loading = false;
    notifyListeners();
  }
}
