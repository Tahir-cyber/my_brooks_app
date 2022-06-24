import 'dart:developer';

import 'package:brooks/views/AccountsRecievableInformation/AccountRecievableInformationViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:provider/provider.dart';

class AccountsRecievableInformationScreen extends StatefulWidget {
  @override
  State<AccountsRecievableInformationScreen> createState() =>
      _AccountsRecievableInformationScreenState();
}

class _AccountsRecievableInformationScreenState
    extends State<AccountsRecievableInformationScreen> {
  bool extendedTermsOption = true;
  bool purchaseOrderOption = true;
  bool submittingInvoice = true;
  bool pendingLawSuits = true;
  bool outstandingLoans = true;
  String receivablesChoiceControllerr = "Goods";

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountRecievableInformationViewmodel>(
        builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'ACCOUNTS RECEIVABLE INFORMATION',
            titleFontSize: 12.sp,
            ontap: () {
              Navigator.pop(context);
              log("back button tapped");
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  ReceivableGoodOptionWidget(),
                  SizedBox(height: 15.h),
                  CustomTextFieldWidget(
                    hint: 'Customers',
                    title: 'Number of Active Customers:',
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFieldWidget(
                    hint: 'Invoices per month:',
                    title: 'Number of invoices per month:',
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFieldWidget(
                    hint: 'Normal Selling Terms',
                    title: 'Normal Selling Terms (30, 60, 90 days)',
                  ),
                  SizedBox(height: 15.h),
                  YesNoOptionWidget(
                    title: 'Are any extended terms granted?',
                    answer: extendedTermsOption,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFieldWidget(
                    hint: 'Sales Volume in \$',
                    title: 'What is your Average Monthly Sales Volume?',
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFieldWidget(
                    hint: 'Annual sales in \$',
                    title: 'What are your Annual Sales \$',
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFieldWidget(
                    hint: 'Amount in \$',
                    title: 'Your Monthly Billing do you wish to factor?',
                  ),
                  SizedBox(height: 15.h),
                  YesNoOptionWidget(
                    title: 'Do you require Purchase Orders from your Clients?',
                    answer: purchaseOrderOption,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFieldWidget(
                    hint: 'What other documentation?',
                    title: 'Documentations do you require from your customers?',
                  ),
                  SizedBox(height: 15.h),
                  YesNoOptionWidget(
                    title: 'Do you require Purchase Orders from your Clients?',
                    answer: purchaseOrderOption,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFieldWidget(
                    hint: 'Factor with',
                    title: 'With whom did you factor?',
                    width: 250.w,
                    titleFontSize: 15.sp,
                  ),
                  SizedBox(height: 15.h),
                  YesNoOptionWidget(
                    title: 'Are you still submitting invoices?',
                    answer: submittingInvoice,
                    width: 260.w,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFieldWidget(
                    hint: 'Reason for leaving?',
                    title: 'What was your reason for leaving?',
                    width: 250.w,
                    titleFontSize: 15.sp,
                  ),
                  SizedBox(height: 15.h),
                  YesNoOptionWidget(
                    title:
                        'Any pending lawsuits against the Applicant or its Principle(s)?',
                    answer: pendingLawSuits,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFieldWidget(
                    hint: 'Explain',
                    title: 'Please explain',
                    width: 250.w,
                    titleFontSize: 15.sp,
                  ),
                  SizedBox(height: 15.h),
                  YesNoOptionWidget(
                    title:
                        'Does the Applicant or its Principle(s) have any outstanding loans',
                    answer: outstandingLoans,
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFieldWidget(
                    hint: 'Including lender amount',
                    title:
                        'List below the Lender Amount Outstanding Collateral',
                    width: 250.w,
                    titleFontSize: 15.sp,
                  ),
                  SizedBox(height: 30.h),
                  CustomSubmitButton(
                    title: 'CONTINUE',
                    ontap: () {
                      log("${model.value}");
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

// ignore: must_be_immutable
class YesNoOptionWidget extends StatefulWidget {
  final String title;
  bool answer;
  final double? width;

  YesNoOptionWidget({required this.answer, required this.title, this.width});

  @override
  State<YesNoOptionWidget> createState() => _YesNoOptionWidgetState();
}

class _YesNoOptionWidgetState extends State<YesNoOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width == null ? 1.sw : widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {});
                  widget.answer = true;
                },
                child: Container(
                  width: 125.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color:
                        widget.answer ? blueColor : greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Text(
                      'Yes',
                      style: GoogleFonts.roboto(
                          color: widget.answer ? whiteColor : greyColor),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
                  widget.answer = false;
                },
                child: Container(
                  width: 125.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color:
                        widget.answer ? greyColor.withOpacity(0.2) : blueColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Text(
                      'No',
                      style: GoogleFonts.roboto(
                          color: widget.answer ? greyColor : whiteColor),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ReceivableGoodOptionWidget extends StatefulWidget {
  @override
  State<ReceivableGoodOptionWidget> createState() =>
      _ReceivableGoodOptionWidgetState();
}

class _ReceivableGoodOptionWidgetState
    extends State<ReceivableGoodOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AccountRecievableInformationViewmodel>(
        builder: (context, model, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Receivables generated from sale of',
            style: GoogleFonts.roboto(fontSize: 13.sp),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  model.changeValue("Goods");
                },
                child: Container(
                  width: 74.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    color: model.value == "Goods"
                        ? blueColor
                        : greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                      child: Text(
                    "Goods",
                    style: TextStyle(
                      color:
                          model.value == "Goods" ? Colors.white : Colors.black,
                    ),
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  model.changeValue("Services");
                },
                child: Container(
                  width: 74.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    color: model.value == "Services"
                        ? blueColor
                        : greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Text("Services",
                        style: TextStyle(
                          color: model.value == "Services"
                              ? Colors.white
                              : Colors.black,
                        )),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  model.changeValue("Both");
                },
                child: Container(
                  width: 74.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    color: model.value == "Both"
                        ? blueColor
                        : greyColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Center(
                    child: Text("Both",
                        style: TextStyle(
                          color: model.value == "Both"
                              ? Colors.white
                              : Colors.black,
                        )),
                  ),
                ),
              )
            ],
          ),
        ],
      );
    });
  }
}
