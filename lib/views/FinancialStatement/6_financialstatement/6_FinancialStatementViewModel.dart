import 'package:brooks/views/FinancialStatement/7_FinancialStatement/7_FinancialStatementScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FinancialStatementViewModel6 extends ChangeNotifier {
  bool loading = false;

  uploadData6(
      {required String cashInBank,
      required String cashInOtherInstitutional,
      required String marketableSecurity,
      required String nonMarketableSecurity,
      required String accountsandNotesReceivable,
      required String netCashvalue,
      required String residentialRealEstate,
      required String cashInOtherInstitutionalShedulec,
      required String realInvestment,
      required String businessMarketValue,
      required String iraKeogh,
      required String defferedIncome,
      required String personalProperty,
      required String otherAssetsList,
      required String otherAssets}) async {
    loading = true;
    notifyListeners();
    FirebaseFirestore.instance.collection("financialStatement6").add(
      {
        "cashInBank": cashInBank,
        "cashInOtherInstitutional": cashInOtherInstitutional,
        "marketableSecurity": marketableSecurity,
        "nonMarketableSecurity": nonMarketableSecurity,
        "accountsandNotesReceivable": accountsandNotesReceivable,
        "netCashvalue": netCashvalue,
        "residentialRealEstate": residentialRealEstate,
        "cashInOtherInstitutionalShedulec": cashInOtherInstitutionalShedulec,
        "realInvestment": realInvestment,
        "businessMarketValue": businessMarketValue,
        "iraKeogh": iraKeogh,
        "defferedIncome": defferedIncome,
        "personalProperty": personalProperty,
        "otherAssetsList": otherAssetsList,
        "otherAssets": otherAssets,
      },
    ).then((value) {
      Get.to(FinancialStatementScreen_7());
    });
    loading = false;
    notifyListeners();
  }
}
