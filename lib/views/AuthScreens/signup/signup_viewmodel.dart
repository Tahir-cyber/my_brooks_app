import 'package:brooks/Models/user_model.dart';
import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/HomePage.dart';
import 'package:brooks/views/home_page_view/home_page_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpViewModel extends ChangeNotifier {
  String? email;
  String? name;
  String? phone;
  bool lodaing = false;

  final auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  String? errorMessage;

  UserModel loggedInUser = UserModel();

  signUp(
      {required name,
      required phone,
      required email,
      required context,
      required password}) async {
        SharedPreferences pref;
    this.name = name;
    this.phone = phone;
    this.email = email;

    try {
      lodaing = true;
      notifyListeners();
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        //flutter toast
        Fluttertoast.showToast(
            msg: "Registration Successful", backgroundColor: blueColor);
        //post user detailed to firestore
        UserDetailed(context);
        //navigate to home page
        Navigator.pushAndRemoveUntil(
            (context),
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (route) => false);
             lodaing = false;
        notifyListeners();
      });
       SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("email", email);
    } catch (e) {
       lodaing = false;
      notifyListeners();
      errorMessage = e.toString();
      Get.snackbar(
        "Sorry",
        errorMessage!,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        colorText: Colors.white,
        backgroundColor: blueColor,
      );
    }
  }

  //post user details to firebase

  UserDetailed(context) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = FirebaseAuth.instance.currentUser;

    UserModel userModel = UserModel();
    userModel.id = user!.uid;
    userModel.name = name;
    userModel.email = email;
    userModel.phone = phone;

    await firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }
}
