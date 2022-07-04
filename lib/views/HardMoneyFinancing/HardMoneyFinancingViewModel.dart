import 'dart:developer';
import 'dart:io';

import 'package:brooks/views/CreditReleaseScreen/CreditReleaseScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HardFinancingViewModel extends ChangeNotifier {
  bool loading = false;
  PlatformFile? file;
  PlatformFile? file2;
  PlatformFile? file3;
  PlatformFile? file4;
  PlatformFile? file5;
  PlatformFile? file6;
  PlatformFile? file7;
  PlatformFile? file8;
  PlatformFile? file9;
  PlatformFile? file10;
  PlatformFile? file11;
  PlatformFile? file12;
  PlatformFile? file13;
  FilePickerResult? result;
  FilePickerResult? result2;
  FilePickerResult? result3;
  FilePickerResult? result4;
  FilePickerResult? result5;
  FilePickerResult? result6;
  FilePickerResult? result7;
  FilePickerResult? result8;
  FilePickerResult? result9;
  FilePickerResult? result10;
  FilePickerResult? result11;
  FilePickerResult? result12;
  FilePickerResult? result13;
  String? pdfUrl;
  String? pdfUrl2;
  String? pdfUrl3;
  String? pdfUrl4;
  String? pdfUrl5;
  String? pdfUrl6;
  String? pdfUrl7;
  String? pdfUrl8;
  String? pdfUrl9;
  String? pdfUrl10;
  String? pdfUrl11;
  String? pdfUrl12;
  String? pdfUrl13;

  List<String> pdfUrlList = [];
  List<String> pdfUrlList2 = [];
  List<String> pdfUrlList3 = [];
  List<String> pdfUrlList4 = [];
  List<String> pdfUrlList5 = [];
  List<String> pdfUrlList6 = [];
  List<String> pdfUrlList7 = [];
  List<String> pdfUrlList8 = [];
  List<String> pdfUrlList9 = [];
  List<String> pdfUrlList10 = [];
  List<String> pdfUrlList11 = [];
  List<String> pdfUrlList12 = [];
  List<String> pdfUrlList13 = [];

  pickFile(index) async {
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
      } else if (index == 8) {
        result8 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result8 == null) return;
        file8 = result8!.files.first;
        notifyListeners();
        print("$file");
      } else if (index == 9) {
        result9 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result9 == null) return;
        file9 = result9!.files.first;
        notifyListeners();
        print("$file");
      } else if (index == 10) {
        result10 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result10 == null) return;
        file10 = result10!.files.first;
        notifyListeners();
        print("$file");
      } else if (index == 11) {
        result11 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result11 == null) return;
        file11 = result11!.files.first;
        notifyListeners();
        print("$file");
      } else if (index == 12) {
        result12 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result12 == null) return;
        file12 = result12!.files.first;
        notifyListeners();
        print("$file");
      } else if (index == 13) {
        result13 = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          // type: FileType.custom,
          // allowedExtensions: ['pdf', 'docx']
        );
        if (result13 == null) return;
        file13 = result13!.files.first;
        notifyListeners();
        print("$file");
      }
    } catch (e) {
      log("picked file error $e");
    }
  }

  //upload file to firebase storage

  uploadFile(index) async {
    if (index == 1) {
      if (file == null) {
        return null;
      }
      pdfUrlList.clear();
      for (int i = 0; i < result!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl = await uploadFileToStorageMethod(file!.path);
        log("id $pdfUrl");
        pdfUrlList.add(pdfUrl.toString());
        notifyListeners();
      }
    } else if (index == 2) {
      if (file2 == null) {
        return null;
      }
      pdfUrlList2.clear();
      for (int i = 0; i < result2!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl2 = await uploadFileToStorageMethod(file2!.path);
        log("id $pdfUrl2");
        pdfUrlList2.add(pdfUrl2.toString());
        notifyListeners();
      }
    } else if (index == 3) {
      if (file3 == null) {
        return null;
      }
      pdfUrlList3.clear();
      for (int i = 0; i < result3!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl3 = await uploadFileToStorageMethod(file3!.path);
        log("id $pdfUrl3");
        pdfUrlList3.add(pdfUrl3.toString());
        notifyListeners();
      }
    } else if (index == 4) {
      if (file4 == null) {
        return null;
      }
      pdfUrlList4.clear();
      for (int i = 0; i < result4!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl4 = await uploadFileToStorageMethod(file4!.path);
        log("id $pdfUrl4");
        pdfUrlList4.add(pdfUrl4.toString());
        notifyListeners();
      }
    } else if (index == 5) {
      if (file5 == null) {
        return null;
      }
      pdfUrlList5.clear();
      for (int i = 0; i < result5!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl5 = await uploadFileToStorageMethod(file5!.path);
        log("id $pdfUrl5");
        pdfUrlList5.add(pdfUrl5.toString());
        notifyListeners();
      }
    } else if (index == 6) {
      if (file6 == null) {
        return null;
      }
      pdfUrlList6.clear();
      for (int i = 0; i < result6!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl6 = await uploadFileToStorageMethod(file6!.path);
        log("id $pdfUrl6");
        pdfUrlList6.add(pdfUrl6.toString());
        notifyListeners();
      }
    } else if (index == 7) {
      if (file7 == null) {
        return null;
      }
      pdfUrlList7.clear();
      for (int i = 0; i < result7!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl7 = await uploadFileToStorageMethod(file7!.path);
        log("id $pdfUrl7");
        pdfUrlList7.add(pdfUrl7.toString());
        notifyListeners();
      }
    } else if (index == 8) {
      if (file8 == null) {
        return null;
      }
      pdfUrlList8.clear();
      for (int i = 0; i < result8!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl8 = await uploadFileToStorageMethod(file8!.path);
        log("id $pdfUrl8");
        pdfUrlList8.add(pdfUrl8.toString());
        notifyListeners();
      }
    } else if (index == 9) {
      if (file9 == null) {
        return null;
      }
      pdfUrlList9.clear();
      for (int i = 0; i < result9!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl9 = await uploadFileToStorageMethod(file9!.path);
        log("id $pdfUrl9");
        pdfUrlList9.add(pdfUrl9.toString());
        notifyListeners();
      }
    } else if (index == 10) {
      if (file10 == null) {
        return null;
      }
      pdfUrlList10.clear();
      for (int i = 0; i < result10!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl10 = await uploadFileToStorageMethod(file10!.path);
        log("id $pdfUrl10");
        pdfUrlList10.add(pdfUrl10.toString());
        notifyListeners();
      }
    } else if (index == 11) {
      if (file11 == null) {
        return null;
      }
      pdfUrlList11.clear();
      for (int i = 0; i < result11!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl11 = await uploadFileToStorageMethod(file11!.path);
        log("id $pdfUrl11");
        pdfUrlList11.add(pdfUrl11.toString());
        notifyListeners();
      }
    } else if (index == 12) {
      if (file12 == null) {
        return null;
      }
      pdfUrlList12.clear();
      for (int i = 0; i < result12!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl12 = await uploadFileToStorageMethod(file12!.path);
        log("id $pdfUrl12");
        pdfUrlList12.add(pdfUrl12.toString());
        notifyListeners();
      }
    } else if (index == 13) {
      if (file13 == null) {
        return null;
      }
      pdfUrlList13.clear();
      for (int i = 0; i < result13!.files.length; i++) {
        log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        pdfUrl13 = await uploadFileToStorageMethod(file13!.path);
        log("id $pdfUrl13");
        pdfUrlList13.add(pdfUrl13.toString());
        notifyListeners();
      }
    }
  }

  //upload file to firebase storage

  uploadFileToStorageMethod(
    file,
  ) async {
    try {
      final response = await FirebaseStorage.instance
          .ref()
          .child(
              "HardMoneyDoc/${DateTime.now().millisecondsSinceEpoch.toString()}")
          .putFile(File(file));

      return await response.ref.getDownloadURL();
    } catch (e) {
      log("url");
      log("upload file error $e");
    }
  }

  clearTheField() {
    result != null ? result!.files.clear() : null;
    result2 != null ? result2!.files.clear() : null;
    result3 != null ? result3!.files.clear() : null;
    result4 != null ? result4!.files.clear() : null;
    result5 != null ? result5!.files.clear() : null;
    result6 != null ? result6!.files.clear() : null;
    result7 != null ? result7!.files.clear() : null;
    result8 != null ? result8!.files.clear() : null;
    result9 != null ? result9!.files.clear() : null;
    result10 != null ? result10!.files.clear() : null;
    result11 != null ? result11!.files.clear() : null;
    result12 != null ? result12!.files.clear() : null;
    result13 != null ? result13!.files.clear() : null;
  }

  //upload file to firebase firestore

  uploadFileToFirestore() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection("LoanForm")
        .doc("${pref.getString("uid")}")
        .collection("hardMoneydoc")
        .add({
      "pdfurl": pdfUrlList,
      "pdfurl2": pdfUrlList2,
      "pdfurl3": pdfUrlList3,
      "pdfurl4": pdfUrlList4,
      "pdfurl5": pdfUrlList5,
      "pdfurl6": pdfUrlList6,
      "pdfurl7": pdfUrlList7,
      "pdfurl8": pdfUrlList8,
      "pdfurl9": pdfUrlList9,
      "pdfurl10": pdfUrlList10,
      "pdfurl11": pdfUrlList11,
      "pdfurl12": pdfUrlList12,
      "pdfurl13": pdfUrlList13,
    }).then((value) {
      clearTheField();
      Get.to(CreditReleaseScreen());
    });
  }
}
