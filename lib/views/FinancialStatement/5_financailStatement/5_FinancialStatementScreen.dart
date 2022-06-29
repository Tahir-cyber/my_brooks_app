import 'package:brooks/PdfWidget/PickPdfWidget.dart';
import 'package:brooks/PdfWidget/pdfWidgetViewModel.dart';
import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/FinancialStatement/5_financailStatement/5_financailStatmentViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FinancialStatementScreen_5 extends StatefulWidget {
  @override
  State<FinancialStatementScreen_5> createState() =>
      _FinancialStatementScreen_5State();
}

class _FinancialStatementScreen_5State
    extends State<FinancialStatementScreen_5> {
  String? name = "arshad pdf";
  bool YesNoButton = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final pdfModel = Provider.of<PdfWidgetViewModel>(context);
    return Consumer<FinancialStatementViewModel5>(
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
                  SizedBox(height: 20.h),
                  Text('Cash Income & Expenditures Statement For Year Ended'),
                  SizedBox(height: 10.h),
                  Text(
                      'Any significant changes expected in the next 1 2 months?'),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          YesNoButton = true;
                        },
                        child: Container(
                          width: 125.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: YesNoButton
                                ? blueColor
                                : greyColor.withOpacity(0.2),
                          ),
                          child: Center(
                            child: Text(
                              'Yes',
                              style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                color: YesNoButton ? whiteColor : greyColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          YesNoButton = false;
                        },
                        child: Container(
                          width: 125.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: YesNoButton
                                ? greyColor.withOpacity(0.2)
                                : blueColor,
                          ),
                          child: Center(
                            child: Text(
                              'No',
                              style: GoogleFonts.roboto(
                                fontSize: 12.sp,
                                color: YesNoButton ? greyColor : whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  pdfModel.file == null
                      ? GestureDetector(
                          onTap: () async {
                            await pdfModel.pickPdf();
                          },
                          child: Image.asset(
                            'assets/images/AppraisalReportImage.png',
                          ),
                        )
                      : SizedBox(child: PdfWidget()),
                  SizedBox(height: 10.h),
                  Text(
                    '* Income from alimony, child support, or separate '
                    'maintenance income need not be revealed if the '
                    'applicant or co-applicant does not wish to have it '
                    'considered as a basis for repaying this obligation.',
                  ),
                  SizedBox(height: 30.h),
                  loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomSubmitButton(
                          title: 'CONTINUE',
                          ontap: () async {
                            setState(() {
                              loading = true;
                            });
                            await pdfModel.uploadPdfFile();
                            await model.uploadData(
                                yesNo: YesNoButton, PdfUrl: pdfModel.pdfUrl!);

                            pdfModel.file = null;
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
