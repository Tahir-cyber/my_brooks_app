import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PdfWidgetViewModel extends ChangeNotifier {
  PlatformFile? file;
  FilePickerResult? result;
  String? pdfUrl;

  // circleLoader(bool loading) {
  //   loading
  //       ? Get.dialog(
  //           Container(
  //             height: 100.h,
  //             width: 100.h,
  //             color: Colors.white,
  //             margin: EdgeInsets.all(20),
  //             child: Center(
  //               child: CircularProgressIndicator(),
  //             ),
  //           ),
  //           barrierDismissible: false,
  //         )
  //       : Get.back();
  // }

  pickPdf() async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      // type: FileType.custom,
      // allowedExtensions: ['pdf', 'docx']
    );
    if (result == null) return;
    file = result!.files.first;
    notifyListeners();
    print("$file");
  }

  uploadPdfFile() async {
    //  TaskSnapshot? response;
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
    for (int i = 0; i < result!.files.length; i++) {
      log("message$i");
      final response = await FirebaseStorage.instance
          .ref()
          .child("Pdf/${DateTime.now().millisecondsSinceEpoch}")
          .putFile(File('${result!.files[i].path}'));
      pdfUrl = await response.ref.getDownloadURL();
      notifyListeners();

      // await FirebaseFirestore.instance.collection(name).add({
      //   "url": url,

      // });
    }
  }
}
