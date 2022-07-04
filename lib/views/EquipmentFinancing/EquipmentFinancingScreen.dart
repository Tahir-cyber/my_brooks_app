import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:brooks/views/EquipmentFinancing/EquipmentFinancingViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../HardMoneyFinancing/HardMoneyFinancingScreen.dart';

class EquipmentFinancingScreen extends StatefulWidget {
  @override
  State<EquipmentFinancingScreen> createState() =>
      _EquipmentFinancingScreenState();
}

class _EquipmentFinancingScreenState extends State<EquipmentFinancingScreen> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<EquipmentFinancingViewModel>(
        builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(title: 'Equipment Financing',ontap: (){
            Get.back();
          },),
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

                  //1>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  UploadDocumentWidget2(
                    onTap: () async {
                      await model.pickFile(1);

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
                                Text('Credit and Realease'),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //2>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  UploadDocumentWidget2(
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
                                Text('Business entity docs')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //3>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  UploadDocumentWidget2(
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
                                Text(
                                    'Business Tax Returns for past\n three years ')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //4>>>>>>>>>>>>>>>>>>>>>>>>>>
                  UploadDocumentWidget2(
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
                                Text(
                                    'Three years fiscal year-end business\n financial statements ')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //5>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  UploadDocumentWidget2(
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
                                Text(
                                    'Year to date business financial\n statements')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //7>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  UploadDocumentWidget2(
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
                                Text('Current Business Debt Schedule')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  UploadDocumentWidget2(
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
                                Text(
                                    'Personal Tax Returns for past three\n years')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //8>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  UploadDocumentWidget2(
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
                                          model.result8!.files[i].name,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                Text(
                                    'Personal Financial Statements\n for principals owning\n 20% + of business')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //9.,,,,,,,,,,,,,,,,,,,
                  UploadDocumentWidget2(
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
                                          model.result9!.files[i].name,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                Text(
                                  'Detailed list of equipment with descriptions\n and costs. Please include shipping, installation,\ntraining and any maintenance agreement costs.',
                                  style: TextStyle(fontSize: 10.sp),
                                )
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  //10>>>>>>>>>>>>>>>>>>>
                  UploadDocumentWidget2(
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
                                          model.result10!.files[i].name,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                Text(
                                    'Copy of the invoice or purchase and\n sales agreement for all equipment')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //>>>>>>>>>>>>>>>>>>111...................
                  UploadDocumentWidget2(
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
                                          model.result11!.files[i].name,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                Text(
                                    'Full contact information for all\n proposed equipment vendors')
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                loading?Center(child: CircularProgressIndicator(),):  CustomSubmitButton(
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
