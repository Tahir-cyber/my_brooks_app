import 'package:brooks/PdfWidget/pdfWidgetViewModel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PdfWidget extends StatefulWidget {
  @override
  State<PdfWidget> createState() => _PdfWidgetState();
}

class _PdfWidgetState extends State<PdfWidget> {
  PlatformFile? file;
  FilePickerResult? result;

  @override
  Widget build(BuildContext context) {
    return Consumer<PdfWidgetViewModel>(builder: (context, model, child) {
      // final kb = model.file!.size / 1024;
      // final mb = kb / 1024;
      // final fileSize = mb > 1
      //     ? '${mb.toStringAsFixed(2)} MB'
      //     : '${kb.toStringAsFixed(2)} KB';

      return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: model.result == null ? 0 : model.result!.files.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            final kb = model.result!.files[index].size / 1024;
            final mb = kb / 1024;
            final fileSize = mb > 1
                ? '${mb.toStringAsFixed(2)} MB'
                : '${kb.toStringAsFixed(2)} KB';
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.white,
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Icon(
                      Icons.picture_as_pdf,
                      size: 30,
                    )),
                    SizedBox(height: 5.h),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(model.result!.files[index].name)),
                    SizedBox(height: 5.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Text("${fileSize}"),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
