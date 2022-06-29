import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  pickPdf(index) async {
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
  }

  uploadPdfFile(index) async {
    //  TaskSnapshot? response;
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

      final response = await FirebaseStorage.instance
          .ref()
          .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
          .putFile(File('${file!.path}'));
      pdfUrl = await response.ref.getDownloadURL();
      notifyListeners();
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

      final response = await FirebaseStorage.instance
          .ref()
          .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
          .putFile(File('${file2!.path}'));
      pdfUrl2 = await response.ref.getDownloadURL();
      notifyListeners();
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

      final response = await FirebaseStorage.instance
          .ref()
          .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
          .putFile(File('${file3!.path}'));
      pdfUrl3 = await response.ref.getDownloadURL();
      notifyListeners();
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

      final response = await FirebaseStorage.instance
          .ref()
          .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
          .putFile(File('${file4!.path}'));
      pdfUrl4 = await response.ref.getDownloadURL();
      notifyListeners();
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

      final response = await FirebaseStorage.instance
          .ref()
          .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
          .putFile(File('${file5!.path}'));
      pdfUrl5 = await response.ref.getDownloadURL();
      notifyListeners();
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

      final response = await FirebaseStorage.instance
          .ref()
          .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
          .putFile(File('${file6!.path}'));
      pdfUrl6 = await response.ref.getDownloadURL();
      notifyListeners();
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

      final response = await FirebaseStorage.instance
          .ref()
          .child("CommerRealDoc/${DateTime.now().millisecondsSinceEpoch}")
          .putFile(File('${file7!.path}'));
      pdfUrl7 = await response.ref.getDownloadURL();
      notifyListeners();
    }
  }
}
