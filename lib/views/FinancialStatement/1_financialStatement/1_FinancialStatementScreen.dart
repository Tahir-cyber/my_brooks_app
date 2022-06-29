import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/FinancialStatement/1_financialStatement/1_financialStatementViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../ScheduleNo1Screen/AgreementDateWidget.dart';

class FinancialStatementScreen_1 extends StatefulWidget {
  @override
  State<FinancialStatementScreen_1> createState() =>
      _FinancialStatementScreen_1State();
}

class _FinancialStatementScreen_1State
    extends State<FinancialStatementScreen_1> {
  final applicantNameController = TextEditingController();
  final employerController = TextEditingController();
  final addressOfEmployeerController = TextEditingController();
  final businessPhoneController = TextEditingController();
  final noOfYearsWithEmployeerController = TextEditingController();
  final positionController = TextEditingController();
  final previousEmployeerNameAndPositionController = TextEditingController();
  final noOfYearsWithPreviousEmployeerController = TextEditingController();
  final homeAddressController = TextEditingController();
  final homePhoneNumberController = TextEditingController();
  final socialSecurityNoController = TextEditingController();
  final nameAndPhoneOfYourAccountantController = TextEditingController();
  final nameAndPhoneOfYourAttornyController = TextEditingController();
  final nameAndPhoneNumberOfYourBrokerController = TextEditingController();
  final nameAndPhoneNumberOfYourinsuranceAdviController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialStatementViewModel1>(
        builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Financial statement',
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('PERSONAL INFORMATION'),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: applicantNameController,
                    hint: 'Name',
                    title: 'APPLICANT (NAME)',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: employerController,
                    hint: 'Employer',
                    title: 'Employer',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: addressOfEmployeerController,
                    hint: 'Address',
                    title: 'Address of Employer',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: businessPhoneController,
                    hint: 'Phone No.',
                    title: 'Business Phone No.',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: noOfYearsWithEmployeerController,
                    hint: 'Years',
                    title: 'No. of Years with Employer',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: positionController,
                    hint: 'Title/position',
                    title: 'Title/position',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: previousEmployeerNameAndPositionController,
                    hint: 'Name & Position',
                    title: 'Name of previous employer & position',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: noOfYearsWithPreviousEmployeerController,
                    hint: 'Years',
                    title: 'No. of Years with previouse Employer',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: homeAddressController,
                    hint: 'Address',
                    title: 'Home Address',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: homePhoneNumberController,
                    hint: 'Phone No',
                    title: 'Home Phone No',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: socialSecurityNoController,
                    hint: 'Social Security No',
                    title: 'Social Security No',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  AgreementDateWidget(
                    title: 'Date of Birth',
                    titleColor: blackColor,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: nameAndPhoneOfYourAccountantController,
                    hint: 'Name & Phone',
                    title: 'Name, Phone No. of your Accountant',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: nameAndPhoneOfYourAttornyController,
                    hint: 'Name & Phone',
                    title: 'Name, Phone No. of your Attorney',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: nameAndPhoneNumberOfYourBrokerController,
                    hint: 'Name & Phone',
                    title: 'Name, Phone No. of your Investment Advisor/Broker',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: nameAndPhoneNumberOfYourinsuranceAdviController,
                    hint: 'Name & Phone',
                    title: 'Name, Phone No. of your insurance Advisor',
                    titleFontSize: 10.sp,
                  ),
                  SizedBox(height: 20.h),
                  model.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomSubmitButton(
                          title: 'CONTINUE',
                          ontap: () async {
                            await model.uploadFinancialStatementData(
                              applicantName: applicantNameController.text,
                              employeer: employerController.text,
                              adressOfEmployeer:
                                  addressOfEmployeerController.text,
                              businessPhone: businessPhoneController.text,
                              noOfYearWithEmployeer:
                                  noOfYearsWithEmployeerController.text,
                              position: positionController.text,
                              nameOfPreviousEmployerAndPosition:
                                  previousEmployeerNameAndPositionController
                                      .text,
                              noOfYearWithPreviousEmployer:
                                  noOfYearsWithPreviousEmployeerController.text,
                              homeAdress: homeAddressController.text,
                              homePhoneNo: homePhoneNumberController.text,
                              socialSecurityNo: socialSecurityNoController.text,
                              dateOfBirth: celebrityScheduleDate,
                              nameAndPhoneOfYourAccountant:
                                  nameAndPhoneOfYourAccountantController.text,
                              nameAndPhoneOfYourAttorny:
                                  nameAndPhoneOfYourAttornyController.text,
                              nameAndPhoneOfYourbroker:
                                  nameAndPhoneNumberOfYourBrokerController.text,
                              nameAndPhoneOfYourInsuranceAdvisor:
                                  nameAndPhoneNumberOfYourinsuranceAdviController
                                      .text,
                            );
                            //clear all the controllers
                            applicantNameController.clear();
                            employerController.clear();
                            addressOfEmployeerController.clear();
                            businessPhoneController.clear();
                            noOfYearsWithEmployeerController.clear();
                            positionController.clear();
                            previousEmployeerNameAndPositionController.clear();
                            noOfYearsWithPreviousEmployeerController.clear();
                            homeAddressController.clear();
                            homePhoneNumberController.clear();
                            socialSecurityNoController.clear();
                            nameAndPhoneOfYourAccountantController.clear();
                            nameAndPhoneOfYourAttornyController.clear();
                            nameAndPhoneNumberOfYourBrokerController.clear();
                            nameAndPhoneNumberOfYourinsuranceAdviController.clear();
                            
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
