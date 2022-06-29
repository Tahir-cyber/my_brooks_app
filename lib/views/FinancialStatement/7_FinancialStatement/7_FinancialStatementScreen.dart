import 'package:brooks/views/FinancialStatement/7_FinancialStatement/7_financialStatementViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../constants/Colors.dart';

class FinancialStatementScreen_7 extends StatelessWidget {
  FinancialStatementScreen_7({Key? key}) : super(key: key);
  final notesPaybleToBankController = TextEditingController();
  final securedControoler = TextEditingController();
  final notSecuredControoler = TextEditingController();
  final notesPaybleToOtherController = TextEditingController();
  final securedControoler2 = TextEditingController();
  final notSecuredControoler2 = TextEditingController();
  final accountspayableController = TextEditingController();
  final magrinAccountsController = TextEditingController();
  final notesDuePartnershipController = TextEditingController();
  final businessMarketvalueController = TextEditingController();
  final taxexPaybleController = TextEditingController();
  final mortgagedebtSheduleCController = TextEditingController();
  final mortgagesdebtIncludingAutomobileController = TextEditingController();
  final lifeInsuranceLoanController = TextEditingController();
  final otherLiabilityController = TextEditingController();
  final otherAssetsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialStatementViewModel7>(
        builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(title: 'Financial Statement'),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Balance Sheet as of'),
                  ),
                  SizedBox(height: 10.h),
                  Divider(thickness: 0.7, color: blackColor),
                  Row(
                    children: [
                      Text('LIABILITIES'),
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
                    controller: notesPaybleToBankController,
                    title: 'Notes Payable to Bank',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: securedControoler,
                    title: 'Secured',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: notSecuredControoler,
                    title: 'Unsecured',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: notesPaybleToOtherController,
                    title: 'Notes Payable to Others',
                    subtitle: '(Schedule E)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: securedControoler2,
                    title: 'Secured',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: notSecuredControoler2,
                    title: 'Unsecured',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: accountspayableController,
                    title: 'Accounts Payable',
                    subtitle: '(including credit cards)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: magrinAccountsController,
                    title: 'Margin Accounts',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: notesDuePartnershipController,
                    title: 'Notes Due: Partnership',
                    subtitle: '(Schedule D)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: businessMarketvalueController,
                    title: 'Business/Partnership Market Value',
                    subtitle: '(Schedule D)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: taxexPaybleController,
                    title: 'Taxes Payable',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: mortgagedebtSheduleCController,
                    title: 'Mortgage Debt',
                    subtitle: '(Schedule C)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: mortgagesdebtIncludingAutomobileController,
                    title: 'Mortgage Debt',
                    subtitle: '(including automobiles)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: lifeInsuranceLoanController,
                    title: 'Life Insurance Loans',
                    subtitle: '(Schedule B)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: otherLiabilityController,
                    title: 'Other Liabilities (List):',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: otherAssetsController,
                    title: 'Other Assets',
                  ),
                  SizedBox(height: 20.h),
                  model.loading
                      ? Center(child: CircularProgressIndicator())
                      : CustomSubmitButton(
                          title: 'CONTINUE',
                          ontap: () {
                            model.uploadData7(
                              notesPayableToBank:
                                  notesPaybleToBankController.text,
                              secured: securedControoler.text,
                              notSecured: notSecuredControoler.text,
                              notesPayableToOthers:
                                  notesPaybleToOtherController.text,
                              secured2: securedControoler2.text,
                              notSecured2: notSecuredControoler2.text,
                              accountspayable: accountspayableController.text,
                              magrinAccounts: magrinAccountsController.text,
                              notesDuePartnership:
                                  notesDuePartnershipController.text,
                              businessMarketvalue:
                                  businessMarketvalueController.text,
                              taxexPayble: taxexPaybleController.text,
                              mortgagedebtSheduleC:
                                  mortgagedebtSheduleCController.text,
                              mortgagesdebtIncludingAutomobile:
                                  mortgagesdebtIncludingAutomobileController
                                      .text,
                              lifeInsuranceLoan:
                                  lifeInsuranceLoanController.text,
                              otherLiability: otherLiabilityController.text,
                              otherAssets: otherAssetsController.text,
                            );
                            //clear all the controllers
                            notesPaybleToBankController.clear();
                            securedControoler.clear();
                            notSecuredControoler.clear();
                            notesPaybleToOtherController.clear();
                            securedControoler2.clear();
                            notSecuredControoler2.clear();
                            accountspayableController.clear();
                            magrinAccountsController.clear();
                            notesDuePartnershipController.clear();
                            businessMarketvalueController.clear();
                            taxexPaybleController.clear();
                            mortgagedebtSheduleCController.clear();
                            mortgagesdebtIncludingAutomobileController.clear();
                            lifeInsuranceLoanController.clear();
                            otherLiabilityController.clear();
                            otherAssetsController.clear();
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

class FinancialStatementBalanceSheetAmoutWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TextEditingController? controller;

  FinancialStatementBalanceSheetAmoutWidget(
      {required this.title, this.subtitle, this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              subtitle == null
                  ? SizedBox()
                  : Text(
                      subtitle!,
                      style: GoogleFonts.roboto(fontSize: 8.sp),
                    ),
            ],
          ),
        ),
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
        TextField(
          controller: controller,
          maxLength: 8,
          keyboardType: TextInputType.number,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
            counterText: "",

            constraints: BoxConstraints(
              maxHeight: 22.h,
              maxWidth: 80.w,
            ),
            fillColor: greyColor.withOpacity(0.5),
            filled: true,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            // counterText: "",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
