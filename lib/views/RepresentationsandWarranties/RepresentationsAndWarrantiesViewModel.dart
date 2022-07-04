import 'dart:developer';
import 'dart:typed_data';

import 'package:brooks/views/CommercialRealEstate/CommercialRealEstateScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';

import '../SgnaturWidget/SignatureWidget.dart';

class RepresentationsAndWarrantiesViewModel extends ChangeNotifier {
  Uint8List? exportedImage;
  Uint8List? exportedImage2;
  String? signatureUrl;
  String? signatureUrl2;
  bool loading = false;
  SignatureController _signatureController = SignatureController(
      penColor: Colors.black,
      penStrokeWidth: 3,
      exportBackgroundColor: Colors.white);
  //>>>>>>>>>>>>
  SignatureController _signatureController2 = SignatureController(
      penColor: Colors.black,
      penStrokeWidth: 3,
      exportBackgroundColor: Colors.white);

  Widget signWidget() {
    return Column(
      children: [
        Signature(
            width: 240.w,
            height: 240.h,
            backgroundColor: Colors.white,
            controller: _signatureController),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            signatureButton(
                title: "Clear",
                onPressed: () {
                  _signatureController.clear();
                }),
            signatureButton(
                title: "Save",
                onPressed: () async {
                  exportedImage = await _signatureController.toPngBytes();
                  notifyListeners();
                  Get.back();
                }),
          ],
        ),
      ],
    );
  }

  //......................................................
  storeSignatureUrl() async {
   
    notifyListeners();
    final ref = FirebaseStorage.instance.ref().child('signature');
    final uploadTask = ref.putData(exportedImage ?? Uint8List(0));
    signatureUrl =
        await uploadTask.then((snapshot) => snapshot.ref.getDownloadURL());

    log("$signatureUrl");

    notifyListeners();
  }

  //>>>>>>>>>>>>>>>>>>>2ndMethod>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  Widget signWidget2() {
    return Column(
      children: [
        Signature(
            width: 240.w,
            height: 240.h,
            backgroundColor: Colors.white,
            controller: _signatureController2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            signatureButton(
                title: "Clear",
                onPressed: () {
                  _signatureController2.clear();
                }),
            signatureButton(
                title: "Save",
                onPressed: () async {
                  exportedImage2 = await _signatureController2.toPngBytes();
                  notifyListeners();
                  Get.back();
                }),
          ],
        ),
      ],
    );
  }

  //>>>>>>>>>>>>>>>>>>>>
  storeSignatureUrl2() async {
    final ref = FirebaseStorage.instance.ref().child('signature');
    final uploadTask = ref.putData(exportedImage2 ?? Uint8List(0));
    signatureUrl2 =
        await uploadTask.then((snapshot) => snapshot.ref.getDownloadURL());

    log("$signatureUrl2");

    notifyListeners();
  }

  //upload
  uploadData(
      {required String yourSignatureDate,
      required String coApplicantSignatureDate}) async {
  
    SharedPreferences pref = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection("LoanForm")
        .doc("${pref.getString("uid")}")
        .collection("representationsAndWarranties")
        .add({
      "applicantSignature": signatureUrl,
      "coApplicantSignature": signatureUrl2,
      "yourSignatureDate": yourSignatureDate,
      "coApplicantSignatureDate": coApplicantSignatureDate,
    }).then((value) {
      Get.to(CommercialRealEstateScreen());
    });
  
    notifyListeners();
  }
}
