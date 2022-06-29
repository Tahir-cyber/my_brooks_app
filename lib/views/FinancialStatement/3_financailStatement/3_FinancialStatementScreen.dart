import 'package:brooks/views/FinancialStatement/3_financailStatement/3_financialStatementViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../constants/Colors.dart';
import '../7_FinancialStatement/7_FinancialStatementScreen.dart';

class FinancialStatementScreen_3 extends StatelessWidget {
  final salaryApplicantController = TextEditingController();
  final salaryCoApplicantController = TextEditingController();
  final bonusesApplicantController = TextEditingController();
  final bonusesCoApplicantController = TextEditingController();
  final rentalIncomeController = TextEditingController();
  final interestController = TextEditingController();
  final dividendIncomeController = TextEditingController();
  final capitalGainController = TextEditingController();
  final businessPartenshipIncomeController = TextEditingController();
  final otherInvestIncomeController = TextEditingController();
  final otherIncomeListController = TextEditingController();
  final socialSecurityIncomeController = TextEditingController();
  final pensionIncomeController = TextEditingController();
  final totalExpenditureController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialStatementViewModel3>(
        builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'Financial Statement',
            ontap: () {
              Get.back();
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Cash Income & Expenditures Statement For Year Ended'),
                  ),
                  SizedBox(height: 10.h),
                  Divider(thickness: 0.7, color: blackColor),
                  Row(
                    children: [
                      Text('ANNUAL INCOME'),
                      Spacer(),
                      Container(
                        height: 20.h,
                        child: VerticalDivider(
                          thickness: 1,
                          color: blackColor,
                          indent: 0,
                          endIndent: 0,
                        ),
                      ),
                      SizedBox(
                        width: 80.w,
                        child: Text('AMOUNT (\$)'),
                      ),
                    ],
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: salaryApplicantController,
                    title: 'Salary (applicant)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: salaryCoApplicantController,
                    title: 'Salary (co-applicant)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: bonusesApplicantController,
                    title: 'Bonuses & Commissions (applicant)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: bonusesCoApplicantController,
                    title: 'Bonuses & Commissions (co-applicant)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: rentalIncomeController,
                    title: 'Rental Income',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: interestController,
                    title: 'Interest Income',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: dividendIncomeController,
                    title: 'Dividend Income',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: capitalGainController,
                    title: 'Capital Gains',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: businessPartenshipIncomeController,
                    title: 'Business / Partnership Income',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: otherInvestIncomeController,
                    title: 'Other Investment Income',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: otherIncomeListController,
                    title: 'Other Income (List)* *',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: socialSecurityIncomeController,
                    title: 'Social Security Income',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: pensionIncomeController,
                    title: 'Pension Income',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: totalExpenditureController,
                    title: 'TOTAL EXPENDITURES',
                  ),
                  SizedBox(height: 20.h),
                  model.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomSubmitButton(
                          title: 'CONTINUE',
                          ontap: () {
                            model.uploadData(
                                applicantSalary: salaryApplicantController.text,
                                coApplicantSalary:
                                    salaryCoApplicantController.text,
                                bonusesAndComissionApplicant:
                                    bonusesApplicantController.text,
                                bonusesAndComissionCoApplicant:
                                    bonusesCoApplicantController.text,
                                rentalIncome: rentalIncomeController.text,
                                interestIncome: interestController.text,
                                dividendsIncome: dividendIncomeController.text,
                                capitalGains: capitalGainController.text,
                                businessPartnershipIncome:
                                    businessPartenshipIncomeController.text,
                                otherInvestementIncome:
                                    otherInvestIncomeController.text,
                                otherIncomeList: otherIncomeListController.text,
                                socialSecurityIncome:
                                    socialSecurityIncomeController.text,
                                pensionIncome: pensionIncomeController.text,
                                totalExpenditure:
                                    totalExpenditureController.text);
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
