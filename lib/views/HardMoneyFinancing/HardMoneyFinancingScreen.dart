import 'dart:developer';

import 'package:brooks/PdfWidget/customColumn.dart';
import 'package:brooks/PdfWidget/pdfWidgetViewModel.dart';
import 'package:brooks/PdfWidget/uploadDocumentWidget3.dart';
import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/HardMoneyFinancing/HardMoneyFinancingViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HardMoneyFinancingScreen extends StatefulWidget {
  @override
  State<HardMoneyFinancingScreen> createState() =>
      _HardMoneyFinancingScreenState();
}

class _HardMoneyFinancingScreenState extends State<HardMoneyFinancingScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<HardFinancingViewModel>(builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(title: 'Hard Money Financing',ontap: (){
            Get.back();
          
          },),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('UPLOAD THE FOLLOWING DOCUMENTS'),
                  ),
                  SizedBox(height: 20.h),
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(1);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file != null &&
                            model.result!.files.length > 0)
                          for (int i = 0; i < model.result!.files.length; i++)
                            Row(
                              children: [
                                model.result!.files[i].extension == 'pdf'
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result!.files[i].name),
                                    SizedBox(height: 10.h),
                                    if (model.file5 != null)
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
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(
                              text: "Credit release",
                              subtitle: "Sign and return"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(2);
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
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result2!.files[i].name),
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
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(text: "Personal financial statement"),
                      ],
                    ),
                  ),

                  SizedBox(height: 10.h),
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(3);
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
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result3!.files[i].name),
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
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(
                              text:
                                  "Bank or brokerage statements\n documentingclosing funds\n & cash reserves"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(4);
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
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result4!.files[i].name),
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
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(
                              text: "Appraisal Report",
                              subtitle: "(if available)"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //5>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(5);
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
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result5!.files[i].name),
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
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(
                              text:
                                  "Signed letter stating the property is\nand will remain non-owner occupied"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //6>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(6);
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
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result6!.files[i].name),
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
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(
                              text: "Rehab summary",
                              subtitle:
                                  "(including scope of work, timeline, and budget)"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //7>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(7);
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
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result7!.files[i].name),
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
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(text: "Evidence of property insurance"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //8>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(8);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file8 != null &&
                            model.result8!.files.length > 0)
                          for (int i = 0; i < model.result8!.files.length; i++)
                            Row(
                              children: [
                                model.result8!.files[i].extension == 'pdf'
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result8!.files[i].name),
                                    SizedBox(height: 10.h),
                                    if (model.file8 != null)
                                      Text(
                                        model.result8!.files[i].size > 1024
                                            ? '${(model.result8!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result8!.files[i].size / 1024).toStringAsFixed(2)} KB',
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
                                        model.result8!.files.removeAt(i);
                                      });

                                      log("message");
                                    },
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(
                              text: "Business entity docs",
                              subtitle:
                                  "(articles of organization or incorporation, signed\noperating agreement, certificate of good standing,\n statement of authority)"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //9>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(9);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file9 != null &&
                            model.result9!.files.length > 0)
                          for (int i = 0; i < model.result9!.files.length; i++)
                            Row(
                              children: [
                                model.result9!.files[i].extension == 'pdf'
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result9!.files[i].name),
                                    SizedBox(height: 10.h),
                                    if (model.file9 != null)
                                      Text(
                                        model.result9!.files[i].size > 1024
                                            ? '${(model.result9!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result9!.files[i].size / 1024).toStringAsFixed(2)} KB',
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
                                        model.result9!.files.removeAt(i);
                                      });

                                      log("message");
                                    },
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(
                              fontSize: 10.sp,
                              text:
                                  "Detailed list of equipment with descriptions\nand costs. Please include shipping,\n installation,training and any\n maintenance agreement costs."),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //10>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(10);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file10 != null &&
                            model.result10!.files.length > 0)
                          for (int i = 0; i < model.result10!.files.length; i++)
                            Row(
                              children: [
                                model.result10!.files[i].extension == 'pdf'
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result10!.files[i].name),
                                    SizedBox(height: 10.h),
                                    if (model.file10 != null)
                                      Text(
                                        model.result10!.files[i].size > 1024
                                            ? '${(model.result10!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result10!.files[i].size / 1024).toStringAsFixed(2)} KB',
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
                                        model.result10!.files.removeAt(i);
                                      });

                                      log("message");
                                    },
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(
                              text:
                                  "Potentially, personal tax returns for\npast three years",
                              subtitle: "(including all schedules)"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //11>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(11);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file11 != null &&
                            model.result11!.files.length > 0)
                          for (int i = 0; i < model.result11!.files.length; i++)
                            Row(
                              children: [
                                model.result11!.files[i].extension == 'pdf'
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result11!.files[i].name),
                                    SizedBox(height: 10.h),
                                    if (model.file11 != null)
                                      Text(
                                        model.result11!.files[i].size > 1024
                                            ? '${(model.result11!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result11!.files[i].size / 1024).toStringAsFixed(2)} KB',
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
                                        model.result11!.files.removeAt(i);
                                      });

                                      log("message");
                                    },
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(
                              text: "Potentially, two months of paystubs"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //12>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(12);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file12 != null &&
                            model.result12!.files.length > 0)
                          for (int i = 0; i < model.result12!.files.length; i++)
                            Row(
                              children: [
                                model.result12!.files[i].extension == 'pdf'
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result12!.files[i].name),
                                    SizedBox(height: 10.h),
                                    if (model.file12 != null)
                                      Text(
                                        model.result12!.files[i].size > 1024
                                            ? '${(model.result12!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result12!.files[i].size / 1024).toStringAsFixed(2)} KB',
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
                                        model.result12!.files.removeAt(i);
                                      });

                                      log("message");
                                    },
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(
                              text:
                                  "Potentially, evidence of additional\ninsurance",
                              subtitle: "(such as flood)"),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //13>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.
                  UploadDocumentWidget3(
                    onTap: () async {
                      await model.pickFile(13);
                    },
                    Column: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (model.file13 != null &&
                            model.result13!.files.length > 0)
                          for (int i = 0; i < model.result13!.files.length; i++)
                            Row(
                              children: [
                                model.result13!.files[i].extension == 'pdf'
                                    ? iconWidget(
                                        icon: Icons.picture_as_pdf,
                                      )
                                    : iconWidget(icon: Icons.image),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    fileNameWidget(
                                        text: model.result13!.files[i].name),
                                    SizedBox(height: 10.h),
                                    if (model.file13 != null)
                                      Text(
                                        model.result13!.files[i].size > 1024
                                            ? '${(model.result13!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                                            : '${(model.result13!.files[i].size / 1024).toStringAsFixed(2)} KB',
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
                                        model.result13!.files.removeAt(i);
                                      });

                                      log("message");
                                    },
                                    child: removeCardWidget()),
                              ],
                            )
                        else
                          elseWidget(
                              text:
                                  "Potentially, property financials and\nincome / expense statements"),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
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
                            await model.uploadFile(1);
                            await model.uploadFile(2);
                            await model.uploadFile(3);
                            await model.uploadFile(4);
                            await model.uploadFile(5);
                            await model.uploadFile(6);
                            await model.uploadFile(7);
                            await model.uploadFile(8);
                            await model.uploadFile(9);
                            await model.uploadFile(10);
                            await model.uploadFile(11);
                            await model.uploadFile(12);
                            await model.uploadFile(13);
                            await model.uploadFileToFirestore();
                            setState(() {
                              loading = false;
                            });
                          },
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

class UploadDocumentWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final VoidCallback? onTap;

  UploadDocumentWidget({
    this.subtitle,
    this.subtitleFontSize,
    this.onTap,
    required this.title,
    this.titleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final pdfModel = Provider.of<PdfWidgetViewModel>(context);
    return Card(
      elevation: 0,
      color: greyColor.withOpacity(0.2),
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Row(
          children: [
            Icon(
              Icons.attach_file,
              size: 20.sp,
              color: greyColor,
            ),
            SizedBox(width: 20.w),
            Container(
              width: 200.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontSize: titleFontSize == null ? 14.sp : titleFontSize,
                    ),
                  ),
                  subtitle == null
                      ? SizedBox(height: 1.h)
                      : SizedBox(
                          height: 0.h,
                        ),
                  subtitle == null
                      ? SizedBox(
                          height: 0,
                          width: 0,
                        )
                      : Text(
                          subtitle!,
                          style: GoogleFonts.roboto(
                            fontSize: subtitleFontSize == null
                                ? 11.sp
                                : subtitleFontSize,
                          ),
                        ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: greyColor,
                    spreadRadius: 0.1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: GestureDetector(
                    onTap: onTap, child: Icon(Icons.file_upload_outlined)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UploadDocumentWidget2 extends StatelessWidget {
  final Widget? Column;

  final String? subtitle;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final VoidCallback? onTap;

  UploadDocumentWidget2({
    this.Column,
    this.subtitle,
    this.subtitleFontSize,
    this.onTap,
    this.titleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final pdfModel = Provider.of<PdfWidgetViewModel>(context);
    return Card(
      elevation: 0,
      color: greyColor.withOpacity(0.2),
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Row(
          children: [
            Column!,
            Spacer(),
            Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: greyColor,
                    spreadRadius: 0.1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: GestureDetector(
                    onTap: onTap, child: Icon(Icons.file_upload_outlined)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
