import 'package:brooks/views/Corporate/corporateScreenViewmodel.dart';
import 'package:brooks/views/FinancialStatement/4_financailStatement/4_FinancialStatementScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinancialStatementViewModel3 extends ChangeNotifier {
  bool loading = false;
  uploadData({
    required String applicantSalary,
    required String coApplicantSalary,
    required String bonusesAndComissionApplicant,
    required String bonusesAndComissionCoApplicant,
    required String rentalIncome,
    required String interestIncome,
    required String dividendsIncome,
    required String capitalGains,
    required String businessPartnershipIncome,
    required String otherInvestementIncome,
    required String otherIncomeList,
    required String socialSecurityIncome,
    required String pensionIncome,
    required String totalExpenditure,
  }) async {
    loading = true;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection("LoanForm")
        .doc("${pref.getString("uid")}")
        .collection("FnCashIncomeAndExpendituresStament")
        .add({
      "applicantSalary": applicantSalary,
      "coApplicantSalary": coApplicantSalary,
      "busnessAndComissionApplicant": bonusesAndComissionApplicant,
      "busnessAndComissionCoApplicant": bonusesAndComissionCoApplicant,
      "rentalIncome": rentalIncome,
      "interestIncome": interestIncome,
      "dividendsIncome": dividendsIncome,
      "capitalGains": capitalGains,
      "businessPartnershipIncome": businessPartnershipIncome,
      "otherInvestementIncome": otherInvestementIncome,
      "otherIncomeList": otherIncomeList,
      "socialSecurityIncome": socialSecurityIncome,
      "pensionIncome": pensionIncome,
      "totalExpenditure": totalExpenditure,
      "userId": userId,
    }).then((value) {
      Get.to(FinancialStatementScreen_4());
    });
    loading = false;
    notifyListeners();
  }
}
