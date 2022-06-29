import 'package:brooks/PdfWidget/pdfWidgetViewModel.dart';
import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/CreditReleaseScreen/CreditReleaseScreen.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HardMoneyFinancingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'Hard Money Financing'),
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
                UploadDocumentWidget(
                  onTap: () {},
                  title: 'Credit release',
                  subtitle: 'Sign and return',
                ),
                SizedBox(height: 10.h),
                UploadDocumentWidget(title: 'Personal financial statement'),
                SizedBox(height: 10.h),
                UploadDocumentWidget(
                  title:
                      'Bank or brokerage statements documenting closing funds & cash reserves',
                  titleFontSize: 12.sp,
                ),
                SizedBox(height: 10.h),
                UploadDocumentWidget(
                  title: 'Appraisal Report',
                  subtitle: '(if available)',
                ),
                SizedBox(height: 10.h),
                UploadDocumentWidget(
                  title:
                      'Signed letter stating the property is and will remain non-owner occupied',
                ),
                SizedBox(height: 10.h),
                UploadDocumentWidget(
                  title: 'Rehab summary',
                  subtitle: '(including scope of work, timeline, and budget)',
                ),
                SizedBox(height: 10.h),
                UploadDocumentWidget(
                  title: 'Evidence of property insurance',
                ),
                SizedBox(height: 10.h),
                UploadDocumentWidget(
                  title: 'Business entity docs',
                  subtitle:
                      '(articles of organization or incorporation, signed '
                      'operating agreement, certificate of good standing, statement of authority)',
                  subtitleFontSize: 8.sp,
                ),
                SizedBox(height: 10.h),
                UploadDocumentWidget(
                  title:
                      'Detailed list of equipment with descriptions and costs. '
                      'Please include shipping, installation, training and any '
                      'maintenance agreement costs.',
                  titleFontSize: 10.sp,
                ),
                SizedBox(height: 10.h),
                UploadDocumentWidget(
                  title:
                      'Potentially, personal tax returns for past three years',
                  titleFontSize: 13.sp,
                  subtitle: '(including all schedules)',
                ),
                SizedBox(height: 10.h),
                UploadDocumentWidget(
                  title: 'Potentially, two months of paystubs',
                ),
                SizedBox(height: 10.h),
                UploadDocumentWidget(
                  title: 'Potentially, evidence of additional insurance',
                  subtitle: '(such as flood)',
                ),
                SizedBox(height: 10.h),
                UploadDocumentWidget(
                  title:
                      'Potentially, property financials and income / expense statements',
                  titleFontSize: 13.sp,
                ),
                SizedBox(height: 30.h),
                CustomSubmitButton(
                  title: 'SUBMIT',
                  routeTo: CreditReleaseScreen(),
                ),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
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
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
                  child: Icon(Icons.file_upload_outlined),
                ),
              )
            ],
          ),
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
