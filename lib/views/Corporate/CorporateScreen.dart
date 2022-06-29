import 'package:brooks/views/Corporate/corporateScreenViewmodel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CorporateScreen extends StatefulWidget {
  @override
  State<CorporateScreen> createState() => _CorporateScreenState();
}

class _CorporateScreenState extends State<CorporateScreen> {
  final nameController1 = TextEditingController();
  final titleController1 = TextEditingController();
  final ownerShipController1 = TextEditingController();
  //.................

  final nameController2 = TextEditingController();
  final titleController2 = TextEditingController();
  final ownerShipController2 = TextEditingController();
  //,....................

  final nameController3 = TextEditingController();
  final ownerShipController3 = TextEditingController();
  final titleController3 = TextEditingController();
  //.........................

  final nameController4 = TextEditingController();
  final ownerShipController4 = TextEditingController();
  final titleController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CorporateViewModel>(builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'CORPORATE',
            ontap: () {
              Get.back();
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: nameController1,
                    hint: 'Name',
                    title: 'OFFICERS / PARTNERS / OWNERS',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFieldWidget(
                        controller: titleController1,
                        hint: 'Title',
                        title: '',
                        width: 133.w,
                      ),
                      CustomTextFieldWidget(
                        controller: ownerShipController1,
                        hint: 'Ownership %',
                        title: '',
                        width: 133.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFieldWidget(
                    controller: nameController2,
                    hint: 'Name',
                    title: 'OFFICERS / PARTNERS / OWNERS',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFieldWidget(
                        controller: titleController2,
                        hint: 'Title',
                        title: '',
                        width: 133.w,
                      ),
                      CustomTextFieldWidget(
                        controller: ownerShipController2,
                        hint: 'Ownership %',
                        title: '',
                        width: 133.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFieldWidget(
                    controller: nameController3,
                    hint: 'Name',
                    title: 'OFFICERS / PARTNERS / OWNERS',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFieldWidget(
                        controller: titleController3,
                        hint: 'Title',
                        title: '',
                        width: 133.w,
                      ),
                      CustomTextFieldWidget(
                        controller: ownerShipController3,
                        hint: 'Ownership %',
                        title: '',
                        width: 133.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFieldWidget(
                    controller: nameController4,
                    hint: 'Name',
                    title: 'OFFICERS / PARTNERS / OWNERS',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFieldWidget(
                        controller: titleController4,
                        hint: 'Title',
                        title: '',
                        width: 133.w,
                      ),
                      CustomTextFieldWidget(
                        controller: ownerShipController4,
                        hint: 'Ownership %',
                        title: '',
                        width: 133.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  model.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomSubmitButton(
                          title: 'CONTINUE',
                          ontap: () async {
                            await model.uploadCorporateData(
                                name1: nameController1.text,
                                title1: titleController1.text,
                                ownerShip1: ownerShipController1.text,
                                name2: nameController2.text,
                                title2: titleController2.text,
                                ownerShip2: ownerShipController2.text,
                                name3: nameController3.text,
                                title3: titleController3.text,
                                ownerShip3: ownerShipController3.text,
                                name4: nameController4.text,
                                title4: titleController4.text,
                                ownerShip4: ownerShipController4.text);

                            //clear all the controllers
                            nameController1.clear();
                            titleController1.clear();
                            ownerShipController1.clear();
                            nameController2.clear();
                            titleController2.clear();
                            ownerShipController2.clear();
                            nameController3.clear();
                            titleController3.clear();
                            ownerShipController3.clear();
                            nameController4.clear();
                            titleController4.clear();
                            ownerShipController4.clear();
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
