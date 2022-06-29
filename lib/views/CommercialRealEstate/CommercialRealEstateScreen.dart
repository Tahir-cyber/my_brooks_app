import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:brooks/views/CommercialRealEstate/CommercialRealEstateViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../HardMoneyFinancing/HardMoneyFinancingScreen.dart';

class CommercialRealEstateScreen extends StatefulWidget {
  @override
  State<CommercialRealEstateScreen> createState() =>
      _CommercialRealEstateScreenState();
}

class _CommercialRealEstateScreenState
    extends State<CommercialRealEstateScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<CommercialRealEstateViewModel>(
        builder: (context, model, index) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Commercial Real Estate',
            ontap: () {
              Get.back();
            },
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('UPLOAD THE FOLLOWING DOCUMENTS'),
                  ),
                  SizedBox(height: 20.h),
                  UploadDocumentWidget2(
                    onTap: () async {
                      await model.pickPdf(1);

                      // if (model.file != null)
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.result != null &&
                            model.result!.files.length > 0)
                          for (int i = 0; i < model.result!.files.length; i++)
                            Row(
                              children: [
                                model.result!.files[i].extension == 'pdf'
                                    ? Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          model.result!.files[i].name,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    if (model.file != null)
                                      Text(
                                        model.result!.files[i].size > 1024
                                            ? '${(model.result!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result!.files[i].size / 1024).toStringAsFixed(2)} KB',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      model.result!.files.removeAt(i);
                                    });

                                    log("message");
                                  },
                                  child: Card(
                                    elevation: 3,
                                    shape: CircleBorder(),
                                    margin: EdgeInsets.zero,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        else
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.attach_file_outlined,
                                    color: Colors.grey),
                                Text('Financial Statement')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  UploadDocumentWidget2(
                    onTap: () async {
                      await model.pickPdf(2);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file2 != null &&
                            model.result2!.files.length > 0)
                          for (int i = 0; i < model.result2!.files.length; i++)
                            Row(
                              children: [
                                model.result2!.files[i].extension == 'pdf'
                                    ? Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          model.result2!.files[i].name,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    if (model.file2 != null)
                                      Text(
                                        model.result2!.files[i].size > 1024
                                            ? '${(model.result2!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result2!.files[i].size / 1024).toStringAsFixed(2)} KB',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      model.result2!.files.removeAt(i);
                                    });

                                    log("message");
                                  },
                                  child: Card(
                                    elevation: 3,
                                    shape: CircleBorder(),
                                    margin: EdgeInsets.zero,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        else
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.attach_file_outlined,
                                    color: Colors.grey),
                                Text('Credit Result')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  UploadDocumentWidget2(
                    onTap: () async {
                      await model.pickPdf(3);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file3 != null &&
                            model.result3!.files.length > 0)
                          for (int i = 0; i < model.result3!.files.length; i++)
                            Row(
                              children: [
                                model.result3!.files[i].extension == 'pdf'
                                    ? Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          model.result3!.files[i].name,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    if (model.file3 != null)
                                      Text(
                                        model.result3!.files[i].size > 1024
                                            ? '${(model.result3!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result3!.files[i].size / 1024).toStringAsFixed(2)} KB',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      model.result3!.files.removeAt(i);
                                    });

                                    log("message");
                                  },
                                  child: Card(
                                    elevation: 3,
                                    shape: CircleBorder(),
                                    margin: EdgeInsets.zero,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        else
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.attach_file_outlined,
                                    color: Colors.grey),
                                Text('Tax Return File')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  UploadDocumentWidget2(
                    onTap: () async {
                      await model.pickPdf(4);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file4 != null &&
                            model.result4!.files.length > 0)
                          for (int i = 0; i < model.result4!.files.length; i++)
                            Row(
                              children: [
                                model.result4!.files[i].extension == 'pdf'
                                    ? Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          model.result4!.files[i].name,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    if (model.file4 != null)
                                      Text(
                                        model.result4!.files[i].size > 1024
                                            ? '${(model.result4!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result4!.files[i].size / 1024).toStringAsFixed(2)} KB',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      model.result4!.files.removeAt(i);
                                    });

                                    log("message");
                                  },
                                  child: Card(
                                    elevation: 3,
                                    shape: CircleBorder(),
                                    margin: EdgeInsets.zero,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        else
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.attach_file_outlined,
                                    color: Colors.grey),
                                Text('Mortgage Statement')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  UploadDocumentWidget2(
                    onTap: () async {
                      await model.pickPdf(5);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file5 != null &&
                            model.result5!.files.length > 0)
                          for (int i = 0; i < model.result5!.files.length; i++)
                            Row(
                              children: [
                                model.result5!.files[i].extension == 'pdf'
                                    ? Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          model.result5!.files[i].name,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    if (model.file5 != null)
                                      Text(
                                        model.result5!.files[i].size > 1024
                                            ? '${(model.result5!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result5!.files[i].size / 1024).toStringAsFixed(2)} KB',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      model.result5!.files.removeAt(i);
                                    });

                                    log("message");
                                  },
                                  child: Card(
                                    elevation: 3,
                                    shape: CircleBorder(),
                                    margin: EdgeInsets.zero,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        else
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.attach_file_outlined,
                                    color: Colors.grey),
                                Text('Rent Rolls And Agreement')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  UploadDocumentWidget2(
                    onTap: () async {
                      await model.pickPdf(6);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file6 != null &&
                            model.result6!.files.length > 0)
                          for (int i = 0; i < model.result6!.files.length; i++)
                            Row(
                              children: [
                                model.result6!.files[i].extension == 'pdf'
                                    ? Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          model.result6!.files[i].name,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    if (model.file6 != null)
                                      Text(
                                        model.result6!.files[i].size > 1024
                                            ? '${(model.result6!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result6!.files[i].size / 1024).toStringAsFixed(2)} KB',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      model.result6!.files.removeAt(i);
                                    });

                                    log("message");
                                  },
                                  child: Card(
                                    elevation: 3,
                                    shape: CircleBorder(),
                                    margin: EdgeInsets.zero,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        else
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.attach_file_outlined,
                                    color: Colors.grey),
                                Text('Picture of Subject Property')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  UploadDocumentWidget2(
                    onTap: () async {
                      await model.pickPdf(7);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file7 != null &&
                            model.result7!.files.length > 0)
                          for (int i = 0; i < model.result7!.files.length; i++)
                            Row(
                              children: [
                                model.result7!.files[i].extension == 'pdf'
                                    ? Icon(
                                        Icons.picture_as_pdf,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          model.result7!.files[i].name,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    if (model.file7 != null)
                                      Text(
                                        model.result7!.files[i].size > 1024
                                            ? '${(model.result7!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result7!.files[i].size / 1024).toStringAsFixed(2)} KB',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(width: 10.w),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      model.result7!.files.removeAt(i);
                                    });

                                    log("message");
                                  },
                                  child: Card(
                                    elevation: 3,
                                    shape: CircleBorder(),
                                    margin: EdgeInsets.zero,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      size: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            )
                        else
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.attach_file_outlined,
                                    color: Colors.grey),
                                Text('Appraisal Report')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomSubmitButton(
                          title: 'SUBMIT',
                          ontap: () async {
                            setState(() {
                              loading = true;
                            });

                            await model.uploadPdfFile(1);
                            await model.uploadPdfFile(2);
                            await model.uploadPdfFile(3);
                            await model.uploadPdfFile(4);
                            await model.uploadPdfFile(5);
                            await model.uploadPdfFile(6);
                            await model.uploadPdfFile(7);
                            setState(() {
                              loading = false;
                            });
                          },
                          // routeTo: EquipmentFinancingScreen(),
                        ),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
