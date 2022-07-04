import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/CreditReleaseScreen/CreditRealseViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:brooks/views/SgnaturWidget/SignatureWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../ScheduleNo1Screen/AgreementDateWidget.dart';

class CreditReleaseScreen extends StatefulWidget {
  @override
  State<CreditReleaseScreen> createState() => _CreditReleaseScreenState();
}

class _CreditReleaseScreenState extends State<CreditReleaseScreen> {
  final nameController = TextEditingController();
  final applicantNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CreditViewModel>(builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'CREDIT RELEASE',
            ontap: (){
              Get.back();
            
            },
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('I hereby authorize  '),
                      SizedBox(
                        height: 20.h,
                        width: 120.w,
                        child: TextField(
                          controller: nameController,
                          maxLength: 17,
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          decoration: InputDecoration(
                              focusedBorder: InputBorder.none, counterText: ""),
                        ),
                      ),
                      Text(
                        ' to verify ',
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                      'any credit information from whatever source it deems appropriate. I further authorize our banks, trade references and financial institutions the right to release by telephone or fax all credit information requested by the Broker.'),
                  Text(
                      'We understand that ANY information obtained will be treated confidentially. It will be used only in assisting applicant in securing business financing. '),
                  SizedBox(height: 20.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              backgroundColor: Colors.white,
                              title: "Draw Yor Signature Here",
                              content: Container(
                                color: Colors.grey,
                                height: 300.h,
                                width: 300.w,
                                child: Column(
                                  children: [
                                    model.signWidget(),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: SignatureWidget(
                            height: 60.h,
                            title: "Signature",
                            signature: model.exportedImage,
                          )),
                      Text(
                        'Draw Your signature above',
                        style: GoogleFonts.roboto(
                          fontSize: 10.sp,
                          color: greyColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: applicantNameController,
                    title: 'Applicant Name',
                    hint: 'Applicant Name',
                  ),
                  SizedBox(height: 10.h),
                  AgreementDateWidget(
                    state: 3,
                    title: 'Date',
                    titleColor: blackColor,
                  ),
                  SizedBox(height: 20.h),
                model.loading?Center(child: CircularProgressIndicator(),):  CustomSubmitButton(
                    title: 'SUBMIT',
                    ontap: () async{
                     await model.storeSignatureUrl();
                     await model.UploadDataToFirebase(name: nameController.text, applicantName: applicantNameController.text);
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
