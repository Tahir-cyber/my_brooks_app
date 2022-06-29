import 'dart:developer';

import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/AccountsRecievableInformation/AccountsRecievableInformationScreen.dart';
import 'package:brooks/views/CompanyInfo/companyinfoViewmodel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CompanyInfo extends StatefulWidget {
  @override
  State<CompanyInfo> createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
 
  final companyNameController = TextEditingController();
  final dbaController = TextEditingController();
  final contactPersonController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final faxController = TextEditingController();
  final emailController = TextEditingController();
  final typeOfBusinessController = TextEditingController();
  final businessStartedController = TextEditingController();
  final stateOfIncorportionController = TextEditingController();
  final numberOfEmployeeController = TextEditingController();
  String? formValue;

  List<String> items = [
    'Business Form 1',
    'Business Form 2',
    'Business Form 3',
    'Business Form 4',
    'Business Form 5',
    'Business Form 6',
    'Business Form 7',
    'Business Form 8',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ComapnyInfoViewModel>(builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'COMPANY INFORMATION',
            ontap: () {
              Navigator.pop(context);
              log("back button tapped");
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Container(
                width: 1.sw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    CustomTextFieldWidget(
                      controller: companyNameController,
                      title:
                          'Legal Name of Company on Articles of Incorporation:',
                      hint: 'Name of Company',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFieldWidget(
                      controller: dbaController,
                      title: 'DBA (if applicable):',
                      hint: 'DBA',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFieldWidget(
                      controller: contactPersonController,
                      title: 'Contact Person Name & Title:',
                      hint: 'Name & Title',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFieldWidget(
                      controller: addressController,
                      title: 'Address',
                      hint: 'Address',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFieldWidget(
                      controller: phoneController,
                      title: 'Phone number',
                      hint: 'Phone',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFieldWidget(
                      controller: faxController,
                      title: 'Fax number',
                      hint: 'Fax',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFieldWidget(
                      controller: emailController,
                      title: 'Email',
                      hint: 'Email',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFieldWidget(
                      controller: typeOfBusinessController,
                      title: 'Type of Business:',
                      hint: 'Type of Business',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFieldWidget(
                      controller: businessStartedController,
                      title: 'Date Business Started:',
                      hint: 'Date Business Started',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFieldWidget(
                      controller: stateOfIncorportionController,
                      title: 'State of Incorporation/Registration:',
                      hint: 'Incorporation/Registration',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFieldWidget(
                      controller: numberOfEmployeeController,
                      title: 'Number of employees:',
                      hint: 'Number of employees',
                    ),
                    SizedBox(height: 15.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Text('Legal form of business:'),
                        ),
                        SizedBox(height: 10.h),
                        CustomDropdownButton2(
                          buttonWidth: 302.w,
                          buttonHeight: 38.h,
                          buttonDecoration: BoxDecoration(
                            color: greyColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          dropdownWidth: 302.w,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          hint: 'Select Item',
                          dropdownItems: items,
                          value: formValue,
                          onChanged: (value) {
                            setState(() {
                              formValue = value;
                            });
                          },
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
                            ontap: () async{
                            
                             await model.uploadDataToFirebase(
                                  companyName:
                                      companyNameController.text,
                                  dba: dbaController.text,
                                  contactPerson: contactPersonController.text,
                                  address: addressController.text,
                                  phoneNumber: phoneController.text,
                                  fax: faxController.text,
                                  email: emailController.text,
                                  typeOfBusiness: typeOfBusinessController.text,
                                  businessStartDate:
                                      businessStartedController.text,
                                  stateOfIncorporation:
                                      stateOfIncorportionController.text,
                                  numberOfEmployees:
                                      numberOfEmployeeController.text,
                                  businessForm: formValue!);
                              print("formValue: ${companyNameController}");

                              companyNameController.clear();
                              dbaController.clear();
                              contactPersonController.clear();
                              addressController.clear();
                              phoneController.clear();
                              faxController.clear();
                              emailController.clear();
                              typeOfBusinessController.clear();
                              businessStartedController.clear();
                              stateOfIncorportionController.clear();
                              numberOfEmployeeController.clear();
                            },
                          ),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
