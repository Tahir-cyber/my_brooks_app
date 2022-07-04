import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/ConfidentialAgreement/ConfidentialAgreementViewmodel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../ScheduleNo1Screen/AgreementDateWidget.dart';

class ConfidentialAgreementScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<ConfidentialAgreementViewmodel>(
        builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(title: 'CONFIDENTIALITY AGREEMENT',ontap: (){
            Get.back();
          
          },),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      'It is understood and agreed to that both Parties may provide certain information to each other that is and must be kept confidential. To ensure protection of such information it is agreed that:'),
                  Text(
                      '1.	The Confidential Information to be disclosed can be described as and includes: Invention description(s), technical and business information relating to proprietary ideas and inventions, ideas, patent able ideas, trade secrets, drawings and/or illustrations, patent searches, existing and/or contemplated products and services, research and development, production, costs, profit and margin information, finances and financial projections, customers, clients, marketing, and current or future business plans and models, regardless of whether such information is designated as “Confidential Information” at the time of its disclosure.'),
                  Text(
                      '2.	Both Parties agree not to directly or indirectly disclose to any person, firm or corporation any of the above Confidential Information unless required to do so by law.'),
                  Text(
                      '3.	Both Parties recognize that immediate and irreparable damage will result to the other Party if any of the terms and conditions of this Agreement are breached.  Accordingly, the both Parties hereby consent to the entry of temporary, preliminary, and permanent injunctive relief against him or her to restrain any such breach, in addition to any other remedies or claims for money damages that the other Party may seek.  The Parties further agree to render an equitable accounting of all earnings, profits and other benefits arising from such violations, and to pay all costs and counsel fees incurred by the other Party in enforcing this Agreement, whose rights shall be cumulative.'),
                  Text(
                      'IN WITNESS WHEREOF, the parties hereto acknowledge, understand and agree to this Confidentiality Agreement.  The Parties understand and intend to be bound by all of the clauses contained in this document and further certify that they have received signed copies of this agreement.'),
                  SizedBox(height: 20.h),
                  AgreementDateWidget2(
                    title: 'Agreement',
                    titleColor: redColor,
                    state: 1,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: nameController,
                    title: 'Customer Name',
                    hint: 'Customer Name',
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: addressController,
                    title: 'Customer Address',
                    hint: 'Customer Address',
                  ),
                  SizedBox(height: 20.h),
                  model.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomSubmitButton(
                          title: 'Submit',
                          ontap: () {
                            model.uploadDataToFirebase(
                                customerName: nameController.text,
                                customerAddress: addressController.text);
                          },
                        ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
