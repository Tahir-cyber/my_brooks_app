import 'dart:developer';
import 'dart:typed_data';

import 'package:brooks/views/ScheduleNo1Screen/ScheduleScreenModel.dart';
import 'package:brooks/views/SgnaturWidget/SignatureWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';

import '../TermsofAgreement/TermsofAgreementScreen.dart';

class CreditViewModel extends ChangeNotifier {
  Uint8List? exportedImage;
  String? signatureUrl;
  bool loading = false;
  SignatureController _signatureController = SignatureController(
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

  storeSignatureUrl() async {
    loading = true;
    notifyListeners();
    final ref = FirebaseStorage.instance.ref().child('signature');
    final uploadTask = ref.putData(exportedImage ?? Uint8List(0));
    signatureUrl =
        await uploadTask.then((snapshot) => snapshot.ref.getDownloadURL());

    log("$signatureUrl");

    notifyListeners();
  }

  UploadDataToFirebase(
      {required String name, required String applicantName}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection("LoanForm")
        .doc("${pref.getString("uid")}")
        .collection("creditRealease")
        .add({
      'signature': signatureUrl,
      "date": creditRealseScreen,
      "name": name,
      "applicantName": applicantName,
    }).then((value) {
      Get.to(TermsofAgreementScreen());
    });
    loading = false;
    notifyListeners();
  }
}
