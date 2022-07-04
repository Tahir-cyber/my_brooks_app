import 'package:brooks/views/FinancialStatement/1_financialStatement/1_FinancialStatementScreen.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommercialRealEstateChecklistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Commercial Real Estate Checklist',
          ontap: () {
            Get.back();
          },
          titleFontSize: 14.sp,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                    'You will require to provide the following documentsfor the commercial real estate.'),
                SizedBox(height: 10.h),
                Text('1) Financial statement'),
                SizedBox(height: 20.h),
                Text('2) Sign & return credit release'),
                SizedBox(height: 20.h),
                Text('3) Personal Tax Returns for past three years'),
                SizedBox(height: 20.h),
                Text(
                    '4) Mortgage notes and latest monthly mortgage statements for all properties'),
                SizedBox(height: 20.h),
                Text(
                    '5) Rent rolls and copies of leases for any investment properties'),
                SizedBox(height: 20.h),
                Text('6) Pictures of subject property'),
                SizedBox(height: 20.h),
                Text('7) Appraisal Report'),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.center,
                  child: CustomSubmitButton(
                    title: 'GET STARTED',
                    ontap: () {
                      Get.to(FinancialStatementScreen_1());
                    },
                  ),
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
