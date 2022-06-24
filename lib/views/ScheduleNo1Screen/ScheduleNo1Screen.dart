import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/ScheduleNo1Screen/AgreementDateWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleNo1Screen extends StatefulWidget {
  @override
  State<ScheduleNo1Screen> createState() => _ScheduleNo1ScreenState();
}

class _ScheduleNo1ScreenState extends State<ScheduleNo1Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Schedule No 1',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ScheduleNo1ScreenText(),
                SizedBox(height: 20.h),
                AgreementDateWidget(
                  title: 'Agreement',
                  titleColor: redColor,
                ),
                SizedBox(height: 10.h),
                Text(
                  'First Party',
                  style: GoogleFonts.roboto(
                    color: blueColor,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextFieldWidget(
                  title: 'My Company',
                  hint: 'My Company Name',
                ),
                SizedBox(height: 10.h),
                CustomTextFieldWidget(
                  title: 'My Address',
                  hint: 'Address',
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFieldWidget(
                      title: 'My City',
                      hint: 'My City',
                      width: 139.w,
                    ),
                    CustomTextFieldWidget(
                      title: 'My Zip',
                      hint: 'My Zip',
                      width: 139.w,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                CustomTextFieldWidget(
                  title: 'My State',
                  hint: 'My State',
                ),
                SizedBox(height: 10.h),
                Text(
                  'Second Party',
                  style: GoogleFonts.roboto(
                    color: blueColor,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextFieldWidget(
                  title: 'Customer',
                  hint: 'Customer Name',
                ),
                SizedBox(height: 10.h),
                CustomTextFieldWidget(
                  title: 'Customer Address',
                  hint: 'Customer Address',
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextFieldWidget(
                      title: 'Customer City',
                      hint: 'Customer City',
                      width: 139.w,
                    ),
                    CustomTextFieldWidget(
                      title: 'Customer Zip',
                      hint: 'Customer Zip',
                      width: 139.w,
                    ),
                  ],
                ),
                CustomTextFieldWidget(
                  title: 'Customer State',
                  hint: 'Customer State',
                ),
                SizedBox(height: 20.h),
                CustomSubmitButton(
                  title: 'Submit',
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSubmitButton extends StatelessWidget {
  final String title;
  final Widget? routeTo;
  VoidCallback? ontap;
  CustomSubmitButton({
    required this.title,
    this.routeTo,
    this.ontap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 266.w,
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: blueColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_forward,
              color: Colors.transparent,
              size: 25.sp,
            ),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                color: whiteColor,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: whiteColor,
              size: 25.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final String title;
  final String hint;
  final double? width;
  final double? height;
  final double? titleFontSize;
  final double? sizedBoxHeight;
  TextEditingController? controller = TextEditingController();

  CustomTextFieldWidget({
    required this.hint,
    required this.title,
    this.titleFontSize,
    this.height,
    this.width,
    this.controller,
    this.sizedBoxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: titleFontSize == null ? 12.sp : titleFontSize,
                color: blackColor,
              ),
            ),
          ),
          SizedBox(height: sizedBoxHeight == null ? 5.h : sizedBoxHeight),
          Container(
            width: width == null ? 304.w : width,
            height: height == null ? 38.h : height,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: greyColor.withOpacity(0.1),
            ),
            child: TextField(
              controller: controller,
              maxLines: 4,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScheduleNo1ScreenText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: GoogleFonts.roboto(fontSize: 12.sp, color: blackColor),
            children: [
              TextSpan(
                text: 'To be attached to and hereby made part of the '
                    'Non-Exclusive Fee Agreement made between ',
              ),
              TextSpan(
                text: 'MyCompany ',
                style: GoogleFonts.roboto(color: redColor),
              ),
              TextSpan(text: '(“First Party”) and '),
              TextSpan(
                text: 'Customer ',
                style: GoogleFonts.roboto(color: redColor),
              ),
              TextSpan(
                text: '(“Second Party ”)',
              ),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: GoogleFonts.roboto(
              color: blackColor,
              fontSize: 12.sp,
            ),
            children: [
              TextSpan(
                text: 'The undersigned parties hereby acknowledge '
                    'and agree that the Broker Services referenced in the Non-Exclusive '
                    'Fee Agreement (the “Agreement”) to which this Schedule is attached '
                    'will be performed by the First Party on the terms and subject to '
                    'the conditions set forth below:',
              ),
              TextSpan(text: 'Brief Description of Transaction: '),
              TextSpan(
                text: 'LoanType',
              ),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: GoogleFonts.roboto(
              color: blackColor,
              fontSize: 12.sp,
            ),
            children: [
              TextSpan(
                  text: 'Contacts:  Contacts include all Funding Sources '
                      'presented by First Party to Second Party.'),
            ],
          ),
        ),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: GoogleFonts.roboto(
              color: blackColor,
              fontSize: 12.sp,
            ),
            children: [
              TextSpan(text: 'Fees: '),
              TextSpan(
                text: 'Fee % or Terms',
                style: GoogleFonts.roboto(color: redColor),
              ),
            ],
          ),
        ),
        Text(
          'Scheduled Closing Date:  To be determined Special Provisions: '
          'Second Party will obtain a Letter of Intent to fund (LOI) or '
          'Commitment Letter from Bank or Lender proposal within 60 days of '
          'contract date. Except as otherwise expressly set forth in this Schedule, '
          'the terms of the Agreement shall control in all respects as it relates to '
          'the Broker Services.  This Schedule, in combination with the above '
          'referenced Agreement, constitutes the entire agreement with respect to the '
          'Broker Services, between the parties hereto, there being no other agreements '
          'or understandings (oral or written) between the undersigned with respect thereto.',
          style: GoogleFonts.roboto(
            color: blackColor,
            fontSize: 12.sp,
          ),
        ),
        RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            style: GoogleFonts.roboto(
              color: blackColor,
              fontSize: 12.sp,
            ),
            children: [
              TextSpan(
                  text:
                      'Executed by the undersigned parties to be effective as of '),
              TextSpan(
                text: 'AgreementDate.',
                style: GoogleFonts.roboto(color: redColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? titleFontSize;
  VoidCallback? ontap;
  CustomAppBar({
    required this.title,
    this.ontap,
    this.titleFontSize,
  });

  @override
  Size get preferredSize => Size.fromHeight(50.h);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 25.h,
              width: 25.h,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: [
                  BoxShadow(
                    color: greyColor,
                    spreadRadius: 0.1,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                ),
              ),
            ),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: titleFontSize == null ? 16.sp : titleFontSize,
                color: blueColor,
              ),
            ),
            Container(
              height: 20.h,
              width: 25.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
