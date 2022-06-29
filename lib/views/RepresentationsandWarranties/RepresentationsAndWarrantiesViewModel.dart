import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../CommercialRealEstate/CommercialRealEstateScreen.dart';

class RepresentationsAndWarrantiesViewModel extends ChangeNotifier{
  bool loading = false;
  uploadData({required String yourSignatureDate,required String coApplicantSignatureDate})async{
    loading = true;
    notifyListeners();
   await FirebaseFirestore.instance.collection("RepresentationsAndWarranties").add({
      "yourSignatureDate": yourSignatureDate,
      "coApplicantSignatureDate": coApplicantSignatureDate,
    }).then((value) {
      Get.to( CommercialRealEstateScreen());
     
    });
     loading = false;
      notifyListeners();
  }

}