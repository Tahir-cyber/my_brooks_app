import 'dart:developer';
import 'dart:io';

import 'package:brooks/views/EquipmentFinancing/EquipmentFinancingScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommercialRealEstateViewModel extends ChangeNotifier {
  PlatformFile? file;
  PlatformFile? file2;
  PlatformFile? file3;
  PlatformFile? file4;
  PlatformFile? file5;
  PlatformFile? file6;
  PlatformFile? file7;
  FilePickerResult? result;
  FilePickerResult? result2;
  FilePickerResult? result3;
  FilePickerResult? result4;
  FilePickerResult? result5;
  FilePickerResult? result6;
  FilePickerResult? result7;
  String? pdfUrl;
  String? pdfUrl2;
  String? pdfUrl3;
  String? pdfUrl4;
  String? pdfUrl5;
  String? pdfUrl6;
  String? pdfUrl7;

  List<String> pdfUrlList = [];
  List<String> pdfUrlList2 = [];
  List<String> pdfUrlList3 = [];
  List<String> pdfUrlList4 = [];
  List<String> pdfUrlList5 = [];
  List<String> pdfUrlList6 = [];
  List<String> pdfUrlList7 = [];

  pickPdf(index) async {
    try {
      if (index == 1) {
        result = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result == null) return;
        file = result!.files.first;
        notifyListeners();
        print("$file");

        print("$file");
      } else if (index == 2) {
        result2 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result2 == null) return;
        file2 = result2!.files.first;
        notifyListeners();
        print("$file");
      } else if (index == 3) {
        result3 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result3 == null) return;
        file3 = result3!.files.first;
        notifyListeners();
        print("$file");
      } else if (index == 4) {
        result4 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result4 == null) return;
        file4 = result4!.files.first;
        notifyListeners();
        print("$file");
      } else if (index == 5) {
        result5 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result5 == null) return;
        file5 = result5!.files.first;
        notifyListeners();
        print("$file");
      } else if (index == 6) {
        result6 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result6 == null) return;
        file6 = result6!.files.first;
        notifyListeners();
        print("$file");
      } else if (index == 7) {
        result7 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result7 == null) return;
        file7 = result7!.files.first;
        notifyListeners();
        print("$file");
      }
    } catch (e) {
      log("picked file error $e");
    }
  }

  uploadPdfFile(index) async {
    //  TaskSnapshot? response;
    try {
      if (index == 1) {
        if (file == null)
          return Get.dialog(
            AlertDialog(
              title: Text("Please select a file"),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          );
        pdfUrlList.clear();
        for (int i = 0; i < result!.files.length; i++) {
          final response = await FirebaseStorage.instance
              .ref()
              .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
              .putFile(File('${result!.files[i].path}'));
          pdfUrl = await response.ref.getDownloadURL();
          pdfUrlList.add(pdfUrl.toString());

          notifyListeners();
          log("pdf url $pdfUrlList");
        }

        log("pdfUrlList $pdfUrlList");
      } else if (index == 2) {
        if (file2 == null)
          return Get.dialog(
            AlertDialog(
              title: Text("Please select a file"),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          );
        pdfUrlList2.clear();
        for (int i = 0; i < result2!.files.length; i++) {
          final response = await FirebaseStorage.instance
              .ref()
              .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
              .putFile(File('${result2!.files[i].path}'));
          pdfUrl2 = await response.ref.getDownloadURL();
          pdfUrlList2.add(pdfUrl2.toString());

          notifyListeners();
        }
      } else if (index == 3) {
        if (file3 == null)
          return Get.dialog(
            AlertDialog(
              title: Text("Please select a file"),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          );
        pdfUrlList3.clear();
        for (int i = 0; i < result3!.files.length; i++) {
          final response = await FirebaseStorage.instance
              .ref()
              .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
              .putFile(File('${result3!.files[i].path}'));
          pdfUrl3 = await response.ref.getDownloadURL();
          pdfUrlList3.add(pdfUrl3.toString());

          notifyListeners();
        }
      } else if (index == 4) {
        if (file4 == null)
          return Get.dialog(
            AlertDialog(
              title: Text("Please select a file"),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          );
        pdfUrlList4.clear();
        for (int i = 0; i < result4!.files.length; i++) {
          final response = await FirebaseStorage.instance
              .ref()
              .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
              .putFile(File('${result4!.files[i].path}'));
          pdfUrl4 = await response.ref.getDownloadURL();
          pdfUrlList4.add(pdfUrl4.toString());

          notifyListeners();
        }
      } else if (index == 5) {
        if (file5 == null)
          return Get.dialog(
            AlertDialog(
              title: Text("Please select a file"),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          );
        pdfUrlList5.clear();
        for (int i = 0; i < result5!.files.length; i++) {
          final response = await FirebaseStorage.instance
              .ref()
              .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
              .putFile(File('${result5!.files[i].path}'));
          pdfUrl5 = await response.ref.getDownloadURL();
          pdfUrlList5.add(pdfUrl5.toString());

          notifyListeners();
        }
      } else if (index == 6) {
        if (file6 == null)
          return Get.dialog(
            AlertDialog(
              title: Text("Please select a file"),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          );
        pdfUrlList6.clear();
        for (int i = 0; i < result6!.files.length; i++) {
          final response = await FirebaseStorage.instance
              .ref()
              .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
              .putFile(File('${result6!.files[i].path}'));
          pdfUrl6 = await response.ref.getDownloadURL();
          pdfUrlList6.add(pdfUrl6.toString());

          notifyListeners();
        }
      } else if (index == 7) {
        if (file7 == null)
          return Get.dialog(
            AlertDialog(
              title: Text("Please select a file"),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          );
        pdfUrlList7.clear();
        for (int i = 0; i < result7!.files.length; i++) {
          final response = await FirebaseStorage.instance
              .ref()
              .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
              .putFile(File('${result7!.files[i].path}'));
          pdfUrl7 = await response.ref.getDownloadURL();
          pdfUrlList7.add(pdfUrl7.toString());

          notifyListeners();
        }
      }
    } catch (e) {
      log("upload file error $e");
    }
  }

  uploadToFirebaseInArray() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await FirebaseFirestore.instance
          .collection("LoanForm")
          .doc("${pref.getString("uid")}")
          .collection("commerRealEstateDoc")
          .add({
        "pdfUrl": pdfUrlList,
        "pdfUrl2": pdfUrlList2,
        "pdfUrl3": pdfUrlList3,
        "pdfUrl4": pdfUrlList4,
        "pdfUrl5": pdfUrlList5,
        "pdfUrl6": pdfUrlList6,
        "pdfUrl7": pdfUrlList7,
      }).then((value) {
        result != null ? result!.files.length = 0 : null;
        result2 != null ? result2!.files.length = 0 : null;
        result3 != null ? result3!.files.length = 0 : null;
        result4 != null ? result4!.files.length = 0 : null;
        result5 != null ? result5!.files.length = 0 : null;
        result6 != null ? result6!.files.length = 0 : null;
        result7 != null ? result7!.files.length = 0 : null;

        Get.to(EquipmentFinancingScreen());
      });
    } catch (e) {
      log("upload to firebase error ${e.toString()}");
    }
  }
}
