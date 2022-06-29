import 'package:brooks/views/FinancialStatement/6_financialstatement/6_FinancialStatementViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../constants/Colors.dart';
import '../7_FinancialStatement/7_FinancialStatementScreen.dart';

class FinancialStatementScreen_6 extends StatelessWidget {
  FinancialStatementScreen_6({Key? key}) : super(key: key);

  final cashInBankController = TextEditingController();
  final cashInOtherInstitutionalController = TextEditingController();
  final marketableSecurityController = TextEditingController();
  final nonMarketableSecurityController = TextEditingController();
  final AccountsandNotesReceivableController = TextEditingController();
  final NetCashvalueControoler = TextEditingController();
  final residentialRealEstateController = TextEditingController();
  final cashInOtherInstitutionalShedulecController = TextEditingController();
  final realInvestmentController = TextEditingController();
  final businessMarketValueControlller = TextEditingController();
  final iraKeoghController = TextEditingController();
  final defferedIncomeController = TextEditingController();
  final personalPropertyController = TextEditingController();
  final otherAssetsListController = TextEditingController();
  final otherAssetsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialStatementViewModel6>(
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
                      child: Text('Balance Sheet as of')),
                  SizedBox(height: 10.h),
                  Divider(thickness: 0.7, color: blackColor),
                  Row(
                    children: [
                      Text('ASSETS'),
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
                    controller: cashInBankController,
                    title: 'Cash in Bank',
                    subtitle: '(checking and savings accounts)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: cashInOtherInstitutionalController,
                    title: 'Cash in Other Financial Institutions',
                    subtitle: '(List) (including money market accounts, CDs)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: marketableSecurityController,
                    title: 'Readily Marketable Securities',
                    subtitle: '(Schedule A)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: nonMarketableSecurityController,
                    title: 'Non-Readily Marketable Securities',
                    subtitle: '(Schedule A)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: AccountsandNotesReceivableController,
                    title: 'Accounts and Notes Receivable',
                    subtitle: '(List) (including money market accounts, CDs)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: NetCashvalueControoler,
                    title: 'Net Cash Surrender Value of Life Insurance',
                    subtitle: '(Schedule B)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: residentialRealEstateController,
                    title: 'Residential Real Estate',
                    subtitle: '(Schedule C)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: cashInOtherInstitutionalShedulecController,
                    title: 'Cash in Other Financial Institutions',
                    subtitle: '(List) (including money market accounts, CDs)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: realInvestmentController,
                    title: 'Real Estate Investments',
                    subtitle: '(Schedule C)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: businessMarketValueControlller,
                    title: 'Business/Partnership Market Value',
                    subtitle: '(Schedule D)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: iraKeoghController,
                    title:
                        'IRA, Keogh, Profit-Sharing & Other Vested Retirement Accts',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: defferedIncomeController,
                    title: 'Deferred Income',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: personalPropertyController,
                    title: 'Personal Property',
                    subtitle: '(including automobiles)',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: otherAssetsListController,
                    title: 'Other Assets',
                    subtitle: '(List):',
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  FinancialStatementBalanceSheetAmoutWidget(
                    controller: otherAssetsController,
                    title: 'Other Assets',
                  ),
                  SizedBox(height: 20.h),
                  model.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomSubmitButton(
                          title: 'CONTINUE',
                          ontap: () async {
                            await model.uploadData6(
                              cashInBank: cashInBankController.text,
                              cashInOtherInstitutional:
                                  cashInOtherInstitutionalController.text,
                              marketableSecurity:
                                  marketableSecurityController.text,
                              nonMarketableSecurity:
                                  nonMarketableSecurityController.text,
                              accountsandNotesReceivable:
                                  AccountsandNotesReceivableController.text,
                              netCashvalue: NetCashvalueControoler.text,
                              residentialRealEstate:
                                  residentialRealEstateController.text,
                              cashInOtherInstitutionalShedulec:
                                  cashInOtherInstitutionalShedulecController
                                      .text,
                              realInvestment: realInvestmentController.text,
                              businessMarketValue:
                                  businessMarketValueControlller.text,
                              iraKeogh: iraKeoghController.text,
                              defferedIncome: defferedIncomeController.text,
                              personalProperty: personalPropertyController.text,
                              otherAssetsList: otherAssetsListController.text,
                              otherAssets: otherAssetsController.text,
                            );

                            //clear all the controllers
                            cashInBankController.clear();
                            cashInOtherInstitutionalController.clear();
                            marketableSecurityController.clear();
                            nonMarketableSecurityController.clear();
                            AccountsandNotesReceivableController.clear();
                            NetCashvalueControoler.clear();
                            residentialRealEstateController.clear();
                            cashInOtherInstitutionalShedulecController.clear();
                            realInvestmentController.clear();
                            businessMarketValueControlller.clear();
                            iraKeoghController.clear();
                            defferedIncomeController.clear();
                            personalPropertyController.clear();
                            otherAssetsListController.clear();
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
