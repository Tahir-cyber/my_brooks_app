import 'package:brooks/views/FinancialStatement/8_FinancialStatement/8_FinancialStatementScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinancialStatementViewModel7 extends ChangeNotifier {
  bool loading = false;

  uploadData7({
    required String notesPayableToBank,
    
    required String secured,
    required String notSecured,
    required String notesPayableToOthers,
    
    required String secured2,
    required String notSecured2,
    required String accountspayable,
    required String magrinAccounts,
    required String notesDuePartnership,
    required String businessMarketvalue,
    required String taxexPayble,
    required String mortgagedebtSheduleC,
    required String mortgagesdebtIncludingAutomobile,
    required String lifeInsuranceLoan,
    required String otherLiability,
    required String otherAssets,
  }) async{
    loading = true;
    notifyListeners();
    await FirebaseFirestore.instance.collection("financialStatement7").add({
      "notesPayableToBank": notesPayableToBank,
      "secured": secured,
      "notSecured": notSecured,
      "notesPayableToOthers": notesPayableToOthers,
      "secured2": secured2,
      "notSecured2": notSecured2,
      "accountspayable": accountspayable,
      "magrinAccounts": magrinAccounts,
      "notesDuePartnership": notesDuePartnership,
      "businessMarketvalue": businessMarketvalue,
      "taxexPayble": taxexPayble,
      "mortgagedebtSheduleC": mortgagedebtSheduleC,
      "mortgagesdebtIncludingAutomobile": mortgagesdebtIncludingAutomobile,
      "lifeInsuranceLoan": lifeInsuranceLoan,
      "otherLiability": otherLiability,
      "otherAssets": otherAssets,
    }).then((value) {
      Get.to(FinancialStatementScreen_8());
    });
    loading = false;
    notifyListeners();
    
  }
}
