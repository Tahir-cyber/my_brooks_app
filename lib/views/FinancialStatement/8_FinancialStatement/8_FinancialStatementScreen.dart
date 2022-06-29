import 'dart:developer';

import 'package:brooks/views/FinancialStatement/8_FinancialStatement/8_FinancialStatementViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Object gurantor = 0;
Object outstandingLetter = 0;
Object suitOrLegalAction = 0;
Object contingently = 0;
Object taxObligation = 0;
Object totalEstimatedTaxliability = 0;

class FinancialStatementScreen_8 extends StatefulWidget {
  @override
  State<FinancialStatementScreen_8> createState() =>
      _FinancialStatementScreen_8State();
}

class _FinancialStatementScreen_8State
    extends State<FinancialStatementScreen_8> {
  final gurantorController = TextEditingController();
  final outstandingLetterController = TextEditingController();
  final suitOrLegalActionController = TextEditingController();
  final contingentlyControoler = TextEditingController();
  final taxObligationController = TextEditingController();
  final totalEstimatedTaxliabilityController = TextEditingController();
  final anyOfTheAboveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FinancialStatementViewModel8>(
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
                children: [
                  SizedBox(height: 10.h),
                  Text('CONTINGENT LIABILITIES'),
                  Divider(thickness: 0.7, color: blackColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('LIABILITIES'),
                      Text('AMOUNT (\$)'),
                    ],
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  Text(
                    'Are you a guarantor, co-maker, or endorser for any debt '
                    'of an individual,  corporation, or partnership?',
                  ),
                  YesNoAmountWidget(
                    controller: gurantorController,
                    name: "gurantor",
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  Text(
                    'Do you have any outstanding letters of credit or surety bonds?',
                  ),
                  YesNoAmountWidget(
                    controller: outstandingLetterController,
                    name: "outstandingLetter",
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  Text(
                    'Are there any suits or legal actions pending against you?',
                  ),
                  YesNoAmountWidget(
                    controller: suitOrLegalActionController,
                 name:  "suitOrLegalAction",
                  
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  Text(
                    'Are you contingently liable on any lease or contract?',
                  ),
                  YesNoAmountWidget(
                    controller: contingentlyControoler,
                    name: "contingently",
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  Text(
                    'Are any of your tax obligations past due?',
                  ),
                  YesNoAmountWidget(
                    controller: taxObligationController,
                    name: "taxObligation",
                  ),
                  Divider(thickness: 0.7, color: blackColor),
                  Text(
                    'What would be your total estimated tax liability if you were to sell your major assets?',
                  ),
                  YesNoAmountWidget(
                    controller: totalEstimatedTaxliabilityController,
                    name: "totalEstimatedTaxliability",
                  ),
                  Text('If yes for any of the above, give details:'),
                  CustomTextFieldWidget(
                    controller: anyOfTheAboveController,
                    hint: 'Details...',
                    title: '',
                    height: 70.h,
                  ),
                  SizedBox(height: 20.h),
                  model.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomSubmitButton(
                          title: 'CONTINUE',
                          ontap: () async {
                            print(gurantor);
                            print(outstandingLetter);
                            await model.uploadData8(
                              gurantorYesNo: gurantor,
                              outstandingLetterYesNo: outstandingLetter,
                              suitOrLegalActionYesNo: suitOrLegalAction,
                              contingentlyYesNo: contingently,
                              taxObligationYesNo: taxObligation,
                              totalEstimatedTaxliabilityYesNo:
                                  totalEstimatedTaxliability,
                              gurantortext: gurantorController.text,
                              outstandingLettertext:
                                  outstandingLetterController.text,
                              suitOrLegalActiontext:
                                  suitOrLegalActionController.text,
                              contingentlytext: contingentlyControoler.text,
                              taxObligationtext: taxObligationController.text,
                              totalEstimatedTaxliabilitytext:
                                  totalEstimatedTaxliabilityController.text,
                              anyOfTheAbovetext: anyOfTheAboveController.text,
                            );
                            //clear all the controllers
                            gurantorController.clear();
                            outstandingLetterController.clear();
                            suitOrLegalActionController.clear();
                            contingentlyControoler.clear();
                            taxObligationController.clear();
                            totalEstimatedTaxliabilityController.clear();
                            anyOfTheAboveController.clear();
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

class YesNoAmountWidget extends StatefulWidget {
  Object? radioValue;
  String? name;
  TextEditingController controller;
  YesNoAmountWidget({
    Key? key,
    required this.controller,
    this.radioValue,
    this.name,
  }) : super(key: key);

  @override
  State<YesNoAmountWidget> createState() => _YesNoAmountWidgetState();
}

class _YesNoAmountWidgetState extends State<YesNoAmountWidget> {
  Object radioValue = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: radioValue,
              onChanged: (value) {
                if (widget.name == "gurantor") {
                  setState(
                    () {
                      radioValue = value!;
                      gurantor = radioValue;
                    },
                  );
                } else if (widget.name == "outstandingLetter") {
                  setState(() {
                    radioValue = value!;
                    outstandingLetter = radioValue;
                  });
                } else if (widget.name == "suitOrLegalAction") {
                  setState(() {
                    radioValue = value!;
                    suitOrLegalAction = radioValue;
                  });
                } else if (widget.name == "contingently") {
                  setState(() {
                    radioValue = value!;
                    contingently = radioValue;
                  });
                } else if (widget.name == "taxObligation") {
                  setState(() {
                    radioValue = value!;
                    taxObligation = radioValue;
                  });
                } else if(widget.name == "totalEstimatedTaxliability") {
                  setState(() {
                    radioValue = value!;
                    totalEstimatedTaxliability = radioValue;
                  });
                } else{
                  log("error");
                }
              },
            ),
            Text('Yes'),
          ],
        ),
        Row(
          children: [
            Radio(
              value: 2,
              groupValue: radioValue,
              onChanged: (value) {
                if (widget.name == "gurantor") {
                  setState(
                    () {
                      radioValue = value!;
                      gurantor = radioValue;
                    },
                  );
                } else if (widget.name == "outstandingLetter") {
                  setState(() {
                    radioValue = value!;
                    outstandingLetter = radioValue;
                  });
                } else if (widget.name == "suitOrLegalAction") {
                  setState(() {
                    radioValue = value!;
                    suitOrLegalAction = radioValue;
                  });
                } else if (widget.name == "contingently") {
                  setState(() {
                    radioValue = value!;
                    contingently = radioValue;
                  });
                } else if (widget.name == "taxObligation") {
                  setState(() {
                    radioValue = value!;
                    taxObligation = radioValue;
                  });
                } else if(widget.name == "totalEstimatedTaxliability") {
                  setState(() {
                    radioValue = value!;
                    totalEstimatedTaxliability = radioValue;
                  });
                } else{
                  log("error");
                }
              },
            ),
            Text('No'),
          ],
        ),
        Spacer(),
        Text('AMOUNT'),
        SizedBox(width: 10.w),
        Container(
          width: 53.w,
          height: 22.h,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: greyColor.withOpacity(0.2),
          ),
          child: TextField(
            controller: widget.controller,
            maxLength: 3,
            keyboardType: TextInputType.number,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: "",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
