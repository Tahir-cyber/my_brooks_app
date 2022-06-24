import 'dart:async';

import 'package:brooks/views/AuthScreens/sign_in/SignInScreen.dart';
import 'package:brooks/views/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var email = pref.getString("email");
    print("Hiii email  " + email.toString());
    Timer(Duration(milliseconds: 500), () {
      email != null
          ? Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()))
          : Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => SignInScreen()));
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', scale: 1.5),
          ],
        ),
      ),
    );
  }
}
