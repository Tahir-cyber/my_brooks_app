import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/NON-EXCLUSIVE%20FEE%20AGREEMENT/NonExclusiveFeeAgreementViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NonExclusiveScreen extends StatelessWidget {
  final firstPartyCompanyNameController = TextEditingController();
  final firstPartyAddressController = TextEditingController();
  final firstPartyCityController = TextEditingController();
  final firstPartyStateController = TextEditingController();
  final firstPartyZipCodeController = TextEditingController();
  final secondPartyNameController = TextEditingController();
  final secondPartyAddressController = TextEditingController();
  final secondPartyCityController = TextEditingController();
  final secondPartyStateController = TextEditingController();
  final secondPartyZipCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<NonExclusiveFeeAgreementViewModel>(
        builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            title: 'NON-EXCLUSIVE FEE AGREEMENT',
            titleFontSize: 13.sp,
            ontap: (){
              Get.back();
            
            },
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  NonExclusiveFeeScreenText(),
                  SizedBox(height: 20.h),
                  Text(
                    'First Party',
                    style: GoogleFonts.roboto(
                      color: blueColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: firstPartyCompanyNameController,
                    title: 'My Company',
                    hint: 'My Company Name',
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: firstPartyAddressController,
                    title: 'My Address',
                    hint: 'Address',
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFieldWidget(
                        controller: firstPartyCityController,
                        title: 'My City',
                        hint: 'My City',
                        width: 139.w,
                      ),
                      CustomTextFieldWidget(
                        controller: firstPartyZipCodeController,
                        title: 'My Zip',
                        hint: 'My Zip',
                        width: 139.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: firstPartyStateController,
                    title: 'My State',
                    hint: 'My State',
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Second Party',
                    style: GoogleFonts.roboto(
                      color: blueColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: secondPartyNameController,
                    title: 'Customer',
                    hint: 'Customer Name',
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    controller: secondPartyAddressController,
                    title: 'Customer Address',
                    hint: 'Customer Address',
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFieldWidget(
                        controller: secondPartyCityController,
                        title: 'Customer City',
                        hint: 'Customer City',
                        width: 139.w,
                      ),
                      CustomTextFieldWidget(
                        controller: secondPartyZipCodeController,
                        title: 'Customer Zip',
                        hint: 'Customer Zip',
                        width: 139.w,
                      ),
                    ],
                  ),
                  CustomTextFieldWidget(
                    controller: secondPartyStateController,
                    title: 'Customer State',
                    hint: 'Customer State',
                  ),
                  SizedBox(height: 20.h),
                  model.loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomSubmitButton(
                          title: 'Submit',
                          ontap: () async {
                            await model.uploadDataTofirebase(
                                firstPartyCompanyName:
                                    firstPartyCompanyNameController.text,
                                firstPartyAddress:
                                    firstPartyAddressController.text,
                                firstPartyCity: firstPartyCityController.text,
                                firstPartyState: firstPartyStateController.text,
                                firstPartyZipCode:
                                    firstPartyZipCodeController.text,
                                secondPartyName: secondPartyNameController.text,
                                secondPartyAddress:
                                    secondPartyAddressController.text,
                                secondPartyCity: secondPartyCityController.text,
                                secondPartyState:
                                    secondPartyStateController.text,
                                secondPartyZipCode:
                                    secondPartyZipCodeController.text);
                            //clear all the controllers
                            firstPartyCompanyNameController.clear();
                            firstPartyAddressController.clear();
                            firstPartyCityController.clear();
                            firstPartyStateController.clear();
                            firstPartyZipCodeController.clear();
                            secondPartyNameController.clear();
                            secondPartyAddressController.clear();
                            secondPartyCityController.clear();
                            secondPartyStateController.clear();
                            secondPartyZipCodeController.clear();
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

class NonExclusiveFeeScreenText extends StatelessWidget {
  const NonExclusiveFeeScreenText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            style: GoogleFonts.roboto(
              color: blackColor,
            ),
            children: [
              TextSpan(text: 'This Agreement is made and entered into on '),
              TextSpan(
                text: 'AgreementDate ',
                style: GoogleFonts.roboto(color: redColor),
              ),
              TextSpan(text: 'by and between '),
              TextSpan(
                text: 'MyCompany ',
                style: GoogleFonts.roboto(color: redColor),
              ),
              TextSpan(text: 'whose address is'),
              TextSpan(
                text: 'MyAddress, MyCity, MyState, MyZip, ',
                style: GoogleFonts.roboto(color: redColor),
              ),
              TextSpan(text: 'hereinafter referred to as “'),
              TextSpan(
                text: 'First Party ',
                style: GoogleFonts.roboto(color: redColor),
              ),
              TextSpan(text: '”, and '),
              TextSpan(
                text: 'Customer ',
                style: GoogleFonts.roboto(color: redColor),
              ),
              TextSpan(text: 'whose address is '),
              TextSpan(
                text:
                    'CustomerAddress, CustomerCity, CustomerState CustomerZip ',
                style: GoogleFonts.roboto(color: redColor),
              ),
              TextSpan(text: ', hereinafter referred to as “Second Party”.'),
            ],
          ),
        ),
        Text(
          'Whereas, the First Party is providing valuable services to the '
          'Second Party; and Whereas, First Party as a “non–exclusive broker” '
          'desires to make available to Second Party its services as a broker for '
          'the purpose of assisting Second Party with obtaining business contacts '
          '(individually, a “Contact” and collectively, “Contacts” which terms shall '
          'include any Affiliate of a Contact as defined below) in connection with '
          'the conduct of Second Party’s business (the “Broker Services”) on condition '
          'that Second Party agrees to refrain from contracting directly with, or '
          'otherwise in any manner circumventing the broker relationship described '
          'herein.  For purposes of this Agreement, “Affiliate” will mean any party '
          'controlling, controlled by or under common control with any Contact, as '
          'well as any party in or with respect to which the Contact or any principal, '
          'officer or director of the Contact holds an equity or profits interest '
          '(or any option or similar right with respect thereto). Whereas, Second Party '
          'desires to engage the services of First Party to perform the Broker Services '
          'on the terms and for the consideration set forth herein. Now, therefore, '
          'in consideration of the mutual undertakings of the parties, and for other '
          'good and valuable consideration, the receipt and sufficiency of which are '
          'hereby acknowledged, the undersigned parties agree as follows:',
        ),
        Text(
          '1.	First Party will perform the Broker Services for the benefit of Second Party '
          'in connection with the transactions described in the attached sequentially numbered '
          'schedules (individually, a “Schedule” and collectively, the “Schedules,” beginning '
          'with Schedule No#1, each of which is attached hereto and incorporated herein by '
          'reference, for the consideration set forth therein.',
        ),
        Text(
          '2.	As consideration for its performance of the Broker Services, Second Party '
          'will pay to First Party at the time of funding the fee listed in SCHEDULE #1 of the '
          'funds received at time of closing.  Should lender commit to additional funds, then '
          'First Party will receive their prorated portion of the agree points listed in SCHEDULE #1 '
          'at the time of each funding',
        ),
        Text(
          '3.	Second Party agrees that, for a period of 12 months from and after the date '
          'of any Schedule (except as otherwise expressly set forth in such Schedule) (the “Lockup Period”), '
          'Second Party will not, without engaging First Party to perform the Broker Services on the '
          'terms set forth in the applicable Schedule, enter into any contract or agreement which '
          'applies only with the contact(s) identified in, or otherwise introduced to Second Party in '
          'connection with, the applicable Schedule(s).',
          style: GoogleFonts.roboto(
            fontSize: 12.sp,
            color: blackColor,
          ),
        ),
        Text(
          '4.	The Broker Fee will be payable to First Party by Second Party without reduction at the time of funding of the transaction described on the applicable Schedule or any other transaction with a contact during the Lockup Period, as described above (the “Closing Date”).  In the event Second Party shall enter into any agreement with any other party with respect to payment of the Broker Fee, such agreement will not alter or diminish any rights or remedies of First Party hereunder (irrespective of whether First Party shall be aware of such agreement), and Second Party shall remain liable for timely payment of the entire Broker Fee owed by Second Party only as it pertains to this contract.',
          style: GoogleFonts.roboto(
            fontSize: 12.sp,
            color: blackColor,
          ),
        ),
        Text(
          '5.	A facsimile of this document shall be deemed and considered as an original, binding and enforceable document.',
        ),
        Text(
          '6.	No Assignment.  Neither this Agreement nor any duties or obligations under this Agreement may be assigned.',
        ),
        Text(
          '7.	Entire Agreement.  This Agreement supersedes any and all agreements, either oral or written, between the Parties with respect to Third Parties introduced to Second Party by First Party.  Both Parties agree that no representations, inducements, promises, or agreements, oral or otherwise, have been made or relied upon by any party or anyone acting on behalf of any party, which are not embodied herein.  Any modification of this Agreement will be effective only if it is in writing and signed by both Parties.',
        ),
        Text(
          '8.	In the event any amounts due under the terms of any Schedule remain outstanding for a period of more than 30 days after the due date thereof, then, in addition to any other remedies to which it may be entitled hereunder or under applicable law, First Party shall be entitled to (i) suspend its performance of all Broker Services and any related services to, for the benefit of, or on behalf of Second Party; and (ii) Assess a 1% late fee for each month that payment for success fee has not been paid in full unless an agreed upon payment arrangement has been made.',
        ),
        Text(
          '9.	First Party and Second Party agree that this is a Non-Exclusive Contract and that the Second Party may be in communication with other broker firms that are seeking funds for this transaction.  First Party acknowledges that should Second Party receive and accepts funds from a third party brokers that the First Party is not entitled to fee.',
        ),
        Text(
          '10.	In the performance of services to be performed by First Party hereunder, it is mutually understood and agreed that First Party will be, and at all times is, acting and performing as an independent contractor to, and not as an employee, partner or agent of, Second Party. Neither First Party nor any of its employees or agents is or will be deemed to be an employee, partner or agent of Second Party for any purpose.',
        ),
        Text(
          '11.	Neither party hereto will reveal or in any manner communicate to any person (other than advisors and /or associates working on behalf of either party) or entity any information regarding the internal business operations or business contacts of the other (generally, “Confidential Information”), which Confidential Information it may have learned or may have received during or after the term of any Schedule, including without limitation any and all information such as client or Contact lists, information received from other Contacts, or any other confidential matters or trade secrets of such party or any of its Affiliates.  The undersigned parties agree that any breach of this covenant of secrecy by one of the parties hereto would result in irreparable damage to the other for which there would be no adequate remedy at law.  Accordingly, this covenant of secrecy shall be enforceable by temporary or permanent orders enjoining any such breach without prejudice to any other rights or remedies of the non-breaching party at law or in equity. All information developed and/or used by First Party in connection herewith and and/or in connection with Broker Services shall remain the sole and exclusive property (which shall be considered Confidential Information) of First Party.  Anything to the contrary contained herein notwithstanding, nothing shall prohibit or otherwise in any manner restrict First Party in its performance of any manner of Broker Services (whether or not similar to those rendered for the benefit of Second Party) for other similarly situated (to Second Party) parties, so long as the performance of such services does not entail the disclosure to any third party of any material Confidential Information regarding Second Party, nor shall First Party’s performance of such services give rise to any right in favor of Second Party to terminate this Agreement, or to deduct or offset any amounts from or against the amounts at any time owed to First Party hereunder.',
        ),
        Text(
          '12.	In the event either party hereto breaches this Agreement, the non-breaching party shall be entitled to terminate this Agreement, to bring suit to recover any and all damages, both direct and consequential, sustained by such non-breaching party, and, with respect to any amounts found by a court of law that is not timely paid under the terms of this Agreement and/or any Schedule, recover interest on such amounts at the highest rate allowed by applicable law from the due date thereof, compounded monthly.  The enumeration of any remedy or remedies herein shall not preclude the non-breaching party from seeking other damages or remedies allowable or available to it at law or in equity.  The parties expressly acknowledge and agree that this Agreement shall, at the option of the party seeking to enforce the same, be enforceable by specific performance.  If any litigation, arbitration or other proceeding is commenced to enforce any portion of this Agreement or to seek a declaration of the rights of the parties hereunder, or as a result of any breach or threatened breach of any provision of this Agreement, the prevailing party shall be entitled to recover from the non-prevailing party all of its costs and expenses incurred in connection with such litigation, arbitration or other proceeding, including without limitation, attorneys’ fees and costs of court associated with the prosecution and appeal of any and all such actions.',
        ),
        Text(
          '13.	This Agreement will be binding on and inure to the benefit of the undersigned parties, and their successors and permitted assigns. This Agreement shall be governed by and construed according to the laws of the State of Colorado, City & County of Denver and the laws of the United States of America.  The parties hereby submit to the jurisdiction of the State of Colorado, City & County of Denver, for the purpose of any suit, action, or proceeding arising out of or related to this Agreement, and hereby agree not to assert by way of defense or otherwise that such suit, action or other proceeding is brought in an inconvenient forum or that the venue of such suit, action or other proceeding is improper.',
        ),
        Text(
          '14.	If any provision of this Agreement or any Schedule shall be deemed invalid or unenforceable by a judicial or quasi-judicial body of competent jurisdiction, such provision shall be modified to the minimum extent necessary to make the same enforceable, or if no such modification shall be possible, deleted, and the remaining provisions of this Agreement (or the applicable Schedule) will remain in full force and effect.',
        ),
        Text(
          'All Parties hereby agree to the full terms and conditions of this Agreement:',
        ),
      ],
    );
  }
}
