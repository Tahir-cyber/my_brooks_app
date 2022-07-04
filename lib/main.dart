import 'package:brooks/PdfWidget/pdfWidgetViewModel.dart';
import 'package:brooks/views/AccountsRecievableInformation/AccountRecievableInformationViewmodel.dart';
import 'package:brooks/views/AuthScreens/sign_in/sign_in_viewmodel.dart';
import 'package:brooks/views/AuthScreens/signup/signup_viewmodel.dart';
import 'package:brooks/views/CommercialRealEstate/CommercialRealEstateViewModel.dart';
import 'package:brooks/views/CompanyInfo/companyinfoViewmodel.dart';
import 'package:brooks/views/ConfidentialAgreement/ConfidentialAgreementViewmodel.dart';
import 'package:brooks/views/Corporate/corporateScreenViewmodel.dart';
import 'package:brooks/views/CreditReleaseScreen/CreditRealseViewModel.dart';
import 'package:brooks/views/EquipmentFinancing/EquipmentFinancingViewModel.dart';
import 'package:brooks/views/FinancialStatement/1_financialStatement/1_financialStatementViewModel.dart';
import 'package:brooks/views/FinancialStatement/2_financialStatement/2_financialStatementViewModel.dart';
import 'package:brooks/views/FinancialStatement/3_financailStatement/3_financialStatementViewModel.dart';
import 'package:brooks/views/FinancialStatement/4_financailStatement/4_financailStatementViewModel.dart';
import 'package:brooks/views/FinancialStatement/5_financailStatement/5_financailStatmentViewModel.dart';
import 'package:brooks/views/FinancialStatement/6_financialstatement/6_FinancialStatementViewModel.dart';
import 'package:brooks/views/FinancialStatement/7_FinancialStatement/7_financialStatementViewModel.dart';
import 'package:brooks/views/FinancialStatement/8_FinancialStatement/8_FinancialStatementViewModel.dart';
import 'package:brooks/views/HardMoneyFinancing/HardMoneyFinancingViewModel.dart';
import 'package:brooks/views/NON-EXCLUSIVE%20FEE%20AGREEMENT/NonExclusiveFeeAgreementViewModel.dart';
import 'package:brooks/views/RepresentationsandWarranties/RepresentationsAndWarrantiesViewModel.dart';
import 'package:brooks/views/ScheduleNo1Screen/scheduleNo1Screen/SheduleNo1ScreenViewModel.dart';
import 'package:brooks/views/SplashScreen.dart';
import 'package:brooks/views/TermsofAgreement/TermsofAgreementviewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

var email;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  SharedPreferences pref = await SharedPreferences.getInstance();
  email = pref.getString('email');
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpViewModel>(
          create: (_) => SignUpViewModel(),
        ),
        ChangeNotifierProvider<SignInViewModel>(
          create: (_) => SignInViewModel(),
        ),
        ChangeNotifierProvider<ComapnyInfoViewModel>(
          create: (_) => ComapnyInfoViewModel(),
        ),
        ChangeNotifierProvider<AccountRecievableInformationViewmodel>(
            create: (_) => AccountRecievableInformationViewmodel()),
        ChangeNotifierProvider<CorporateViewModel>(
          create: (context) => CorporateViewModel(),
        ),
        ChangeNotifierProvider<FinancialStatementViewModel1>(
          create: (context) => FinancialStatementViewModel1(),
        ),
        ChangeNotifierProvider<FinancialStatementViewModel2>(
          create: (context) => FinancialStatementViewModel2(),
        ),
        ChangeNotifierProvider<FinancialStatementViewModel3>(
          create: (context) => FinancialStatementViewModel3(),
        ),
        ChangeNotifierProvider<FinancialStatementViewModel4>(
          create: (context) => FinancialStatementViewModel4(),
        ),
        ChangeNotifierProvider<FinancialStatementViewModel5>(
          create: (context) => FinancialStatementViewModel5(),
        ),
        ChangeNotifierProvider<FinancialStatementViewModel6>(
          create: (context) => FinancialStatementViewModel6(),
        ),
        ChangeNotifierProvider<FinancialStatementViewModel7>(
          create: (context) => FinancialStatementViewModel7(),
        ),
        ChangeNotifierProvider<RepresentationsAndWarrantiesViewModel>(
          create: (context) => RepresentationsAndWarrantiesViewModel(),
        ),
        ChangeNotifierProvider<FinancialStatementViewModel8>(
          create: (context) => FinancialStatementViewModel8(),
        ),
        ChangeNotifierProvider<CommercialRealEstateViewModel>(
          create: (context) => CommercialRealEstateViewModel(),
        ),
        ChangeNotifierProvider<EquipmentFinancingViewModel>(
          create: (context) => EquipmentFinancingViewModel(),
        ),
        ChangeNotifierProvider<HardFinancingViewModel>(
          create: (context) => HardFinancingViewModel(),
        ),
        ChangeNotifierProvider<CreditViewModel>(
          create: (context) => CreditViewModel(),
        ),
        ChangeNotifierProvider<PdfWidgetViewModel>(
          create: (context) => PdfWidgetViewModel(),
        ),
        ChangeNotifierProvider<TermsOfAgreementViewModel>(
          create: (context) => TermsOfAgreementViewModel(),
        ),
        ChangeNotifierProvider<ConfidentialAgreementViewmodel>(
          create: (context) => ConfidentialAgreementViewmodel(),
        ),
        ChangeNotifierProvider<NonExclusiveFeeAgreementViewModel>(
          create: (context) => NonExclusiveFeeAgreementViewModel(),
        ),
        ChangeNotifierProvider<SheduleNo1ScreenViewModel>(
          create: (context) => SheduleNo1ScreenViewModel(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(325, 674),
        builder: (_, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        ),
        child: SplashScreen(),
      ),
    );
  }
}
