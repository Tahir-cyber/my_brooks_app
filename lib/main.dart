import 'package:brooks/views/AccountsRecievableInformation/AccountRecievableInformationViewmodel.dart';
import 'package:brooks/views/AuthScreens/sign_in/sign_in_viewmodel.dart';
import 'package:brooks/views/AuthScreens/signup/signup_viewmodel.dart';
import 'package:brooks/views/CompanyInfo/companyinfoViewmodel.dart';
import 'package:brooks/views/SplashScreen.dart';
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
