import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/HomePage.dart';
import 'package:brooks/views/home_page_view/home_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInViewModel extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  String? errorMessage;
  bool loading = false;
  String? uid;
  void logIn(email, password, context) async {
     SharedPreferences pref;
    try {
      loading = true;
      notifyListeners();

      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        uid = value.user!.uid;
        print("this is may be uid  $uid");
        Fluttertoast.showToast(
            msg: "Login Successful", backgroundColor: blueColor);
        Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(builder: (context) =>  HomeScreen()),
            (route) => false);
        loading = false;
        notifyListeners();
        
      });
      pref = await SharedPreferences.getInstance();
      pref.setString("email", email);
    } on FirebaseAuthException catch (error) {
      loading = false;

      notifyListeners();

      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      errorMessage = error.toString();
      Get.snackbar(
        "Sorry",
        errorMessage!,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        colorText: whiteColor,
        backgroundColor: blueColor,
      );
    }
  }

}