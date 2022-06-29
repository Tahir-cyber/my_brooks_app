import 'dart:developer';

import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/RepresentationsandWarranties/RepresentationsAndWarrantiesViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/AgreementDateWidget.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RepresentationsAndWarrantiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String date = 'DD/MM/YYYY';
    String date2 = 'DD/MM/YYYY';
    return Consumer<RepresentationsAndWarrantiesViewModel>(
        builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Representations and Warranties',
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
                  Text(
                    'The information contained in this statement is provided to induce '
                    'you to extend or to continue the extension of credit to the undersigned '
                    'or to others upon the guarantee of the undersigned. The undersigned '
                    'acknowledge and understand that you are relying on the information provided '
                    'herein in deciding to grant or continue credit or to accept a guarantee '
                    'thereof. Each of the undersigned represents, warrants and certifies that '
                    'the information provided herein is true, correct and complete. Each of the '
                    'undersigned agrees to notify you immediately and in writing of any change '
                    'in name, address, or employment and of any material adverse Change (1) in '
                    'any of the information contained in this statement or (2) in the financial '
                    'condition of any of the undersigned or (3) in the ability of any of the '
                    'undersigned to perform its (or their) obligations to you. In the absence of '
                    'such notice or a new and full written statement, this should be considered '
                    'as a continuing statement and substantially correct. If the undersigned fail '
                    'to notify you as required above, or if any of the information herein should '
                    'prove to be inaccurate or incomplete in any material respect, you may declare '
                    'the indebtedness of the undersigned or the indebtedness guaranteed by the '
                    'undersigned. as the case may be, immediately due and payable. You are '
                    'authorized to make all inquiries you deem necessary to verify the '
                    'accuracy of the information contained herein and to determine the '
                    'credit-worthiness of the undersigned. The undersigned authorize any '
                    'person or consumer reporting agency to give you any information it '
                    'may have on the undersigned. Each of the undersigned authorizes you '
                    'to answer questions about your credit experience with the'
                    'undersigned. As long as any obligation or guarantee of the undersigned '
                    'to you is outstanding, the undersigned shall supply annually an updated '
                    'financial statement. This personal financial statement and any other '
                    'financial or other information that the undersigned give you shall be '
                    'your property',
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFieldWidget(
                            hint: '',
                            title: 'Your Signature',
                            width: 150.w,
                            height: 60.h,
                          ),
                          Text(
                            'Draw Your signature above',
                            style: GoogleFonts.roboto(
                              fontSize: 10.sp,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                      AgreementDateWidget(
                        title: 'Date',
                        width: 130.w,
                        titleColor: blackColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFieldWidget(
                            hint: '',
                            title: 'Co-Applicant\'s Signature',
                            width: 150.w,
                            height: 60.h,
                          ),
                          Text(
                            'Draw Your signature above',
                            style: GoogleFonts.roboto(
                              fontSize: 10.sp,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                      AgreementDateWidget(
                        state: 2,
                        title: 'Date',
                        width: 130.w,
                        titleColor: blackColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  model.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomSubmitButton(
                          title: 'SUBMIT',
                          ontap: () async {
                            log("$celebrityScheduleDate");
                            log("$celebrityScheduleDate2");
                            log("$celebrityScheduleDate2");
                            await model.uploadData(
                                yourSignatureDate: celebrityScheduleDate,
                                coApplicantSignatureDate:
                                    celebrityScheduleDate2);
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
