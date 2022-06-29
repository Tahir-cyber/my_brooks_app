import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../RepresentationsandWarranties/RepresentationsAndWarrantiesScreen.dart';

class FinancialStatementViewModel8 extends ChangeNotifier {
  double value1 = 0;
  Object value2 = 0;
  Object radioValue = 0;
  changeValue(index) {
    value2 = index;

    notifyListeners();
    print("index:$index");
  }

  bool loading = false;
  uploadData8({
    required Object gurantorYesNo,
    required Object outstandingLetterYesNo,
    required Object suitOrLegalActionYesNo,
    required Object contingentlyYesNo,
    required Object taxObligationYesNo,
    required Object totalEstimatedTaxliabilityYesNo,
    required String gurantortext,
    required String outstandingLettertext,
    required String suitOrLegalActiontext,
    required String contingentlytext,
    required String taxObligationtext,
    required String totalEstimatedTaxliabilitytext,
    required String anyOfTheAbovetext,
  }) async {
    loading = true;
    notifyListeners();
    await FirebaseFirestore.instance.collection("financialStatement8").add({
      "gurantorYesNo": gurantorYesNo==1?"Yes":"No",
      "outstandingLetterYesNo": outstandingLetterYesNo==1?"Yes":"No",
      "suitOrLegalActionYesNo": suitOrLegalActionYesNo==1?"Yes":"No",
      "contingentlyYesNo": contingentlyYesNo==1?"Yes":"No",
      "taxObligationYesNo": taxObligationYesNo==1?"Yes":"No",
      "totalEstimatedTaxliabilityYesNo": totalEstimatedTaxliabilityYesNo==1?"Yes":"No",
      "gurantortext": gurantortext,
      "outstandingLettertext": outstandingLettertext,
      "suitOrLegalActiontext": suitOrLegalActiontext,
      "contingentlytext": contingentlytext,
      "taxObligationtext": taxObligationtext,
      "totalEstimatedTaxliabilitytext": totalEstimatedTaxliabilitytext,
      "anyOfTheAbovetext": anyOfTheAbovetext,
    }).then((value) {
      Get.to(RepresentationsAndWarrantiesScreen());
    });
    loading = false;
    notifyListeners();
  }
}
