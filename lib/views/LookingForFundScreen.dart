import 'package:brooks/views/CompanyInfo/CompanyInfo.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LookingForFundsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Looking for Funding',
          ontap: () {
            Navigator.pop(context);
          },
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  'Hey there! You are going to apply for a loan, in order to be succeed you will need to collect the appropriate documents for your application. You will need to provide all the necessary information form, agreements etc.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Spacer(),
              CustomSubmitButton(
                  title: 'Get Started',
                  ontap: () {
                    Get.to(CompanyInfo());
                  }),
              SizedBox(height: 100)
            ],
          ),
        ),
      ),
    );
  }
}
