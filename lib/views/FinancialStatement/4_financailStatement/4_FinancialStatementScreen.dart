import 'package:brooks/views/FinancialStatement/4_financailStatement/4_financailStatementViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../constants/Colors.dart';
import '../7_FinancialStatement/7_FinancialStatementScreen.dart';

class FinancialStatementScreen_4 extends StatelessWidget {
  final fedralIncomeAndTaxesController = TextEditingController();
  final stateIncomeAndTaxesController = TextEditingController();
  final propertyTaxesController = TextEditingController();
  final mortgageIntrestController = TextEditingController();
  final mortgagePrincipleController = TextEditingController();
  final installementController = TextEditingController();
  final insuranceController = TextEditingController();
  final investmentController = TextEditingController();
  final IraAndOtherDeductibleController = TextEditingController();
  final tutionAndDaycareController = TextEditingController();
  final otherLivingExpenController = TextEditingController();
  final MedicalAndDentalExpenController = TextEditingController();
  final otherExpensesListController = TextEditingController();
  final totalExpenditureController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialStatementViewModel4>(
        builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(title: 'Financial Statement'),
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
                      Text('ANNUAL EXPENDITURES'),
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
                    controller: fedralIncomeAndTaxesController,
                    title: 'Federal Income and Other Taxes',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: stateIncomeAndTaxesController,
                    title: 'State Income and Other Taxes',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: propertyTaxesController,
                    title: 'Property Taxes',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: mortgagePrincipleController,
                    title: 'Mortgage Principal',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: mortgageIntrestController,
                    title: 'Mortgage Interest ',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: installementController,
                    title: 'Installment & Revolving Credit Card Debt',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: insuranceController,
                    title: 'Insurance (car, life, health, home',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: investmentController,
                    title: 'Investments',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: IraAndOtherDeductibleController,
                    title: 'IRA & other deductible retirement pmts',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: tutionAndDaycareController,
                    title: 'Tuition / Child Support / Daycare',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: otherLivingExpenController,
                    title: 'Other Living Expense',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: MedicalAndDentalExpenController,
                    title: 'Medical and Dental Expenses',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: otherExpensesListController,
                    title: 'Other Expense (List)',
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
                          ontap: () async {
                            await model.uploadData(
                              fedralIncome: fedralIncomeAndTaxesController.text,
                              StateIncome: stateIncomeAndTaxesController.text,
                              propertyTax: propertyTaxesController.text,
                              MortgagePrinciple:
                                  mortgagePrincipleController.text,
                              MortgageInterest: mortgageIntrestController.text,
                              installment: installementController.text,
                              insurance: insuranceController.text,
                              investment: investmentController.text,
                              iraAndOtherExpenses:
                                  IraAndOtherDeductibleController.text,
                              tutionaChildDayCareExpen:
                                  tutionAndDaycareController.text,
                              otherLivingExpenses:
                                  otherLivingExpenController.text,
                              medicalAndDentalExpenses:
                                  MedicalAndDentalExpenController.text,
                              otherExpensesList:
                                  otherExpensesListController.text,
                              totalExpenditure: totalExpenditureController.text,
                            );

                            //clear all the controllers
                            fedralIncomeAndTaxesController.clear();
                            stateIncomeAndTaxesController.clear();
                            propertyTaxesController.clear();
                            mortgagePrincipleController.clear();
                            mortgageIntrestController.clear();
                            installementController.clear();
                            insuranceController.clear();
                            investmentController.clear();
                            IraAndOtherDeductibleController.clear();
                            tutionAndDaycareController.clear();
                            otherLivingExpenController.clear();
                            MedicalAndDentalExpenController.clear();
                            otherExpensesListController.clear();
                            totalExpenditureController.clear();
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
