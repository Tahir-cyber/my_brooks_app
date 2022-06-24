import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/AuthScreens/signup/signup_viewmodel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

import '../sign_in/SignInScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpViewModel>(builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Stack(
                children: [
                  Container(
                    height: 1.sh,
                    child: Column(
                      children: [
                        SizedBox(height: 70.h),
                        Image.asset(
                          'assets/images/logo.png',
                          scale: 2,
                        ),
                        model.lodaing
                            ? AlertDialog(
                                content: Center(
                                  child: LoadingIndicator(
                                    colors: [blueColor],
                                    indicatorType:
                                        Indicator.ballClipRotatePulse,
                                    strokeWidth: 1,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(top: 30.w, left: 30.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome Back',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xff707070),
                                      ),
                                    ),
                                    Text(
                                      'Login to your account',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xff707070),
                                      ),
                                    ),
                                    SizedBox(height: 15.h),
                                    LogInTextField(
                                        controller: _nameController,
                                        text: 'Full Name',
                                        icon: Icons.person,
                                        inputType: TextInputType.text,
                                        validator: (value) {
                                          RegExp regex = RegExp(r'^.{3,}$');
                                          if (value!.isEmpty) {
                                            return ("Name cannot be Empty");
                                          }
                                          if (!regex.hasMatch(value)) {
                                            return ("Enter Valid name(Min. 3 Character)");
                                          }
                                          return null;
                                        }),
                                    SizedBox(height: 25.h),
                                    LogInTextField(
                                        controller: _phoneController,
                                        text: 'Phone Number',
                                        icon: Icons.phone_android_sharp,
                                        inputType: TextInputType.phone,
                                        validator: (value) {
                                          if (value!.length != 10)
                                            return 'Mobile Number must be of 10 digit';
                                          else
                                            return null;
                                        }),
                                    SizedBox(height: 25.h),
                                    LogInTextField(
                                      controller: _emailController,
                                      text: 'Email',
                                      icon: Icons.email,
                                      inputType: TextInputType.emailAddress,
                                      validator: (value) {
                                        RegExp regex = RegExp(
                                            r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
                                        if (value!.isEmpty) {
                                          return ("Email cannot be Empty");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("Enter Valid Email");
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 25.h),
                                    LogInTextField(
                                      controller: _passwordController,
                                      text: 'Password',
                                      icon: Icons.vpn_key_outlined,
                                      validator: (value) {
                                        RegExp regex = RegExp(r'^.{6,}$');
                                        if (value!.isEmpty) {
                                          return ("Password is required for login");
                                        }
                                        if (!regex.hasMatch(value)) {
                                          return ("Enter Valid Password(Min. 6 Character)");
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 25.h),
                                    GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState!.validate()) {
                                          model.signUp(
                                              name: _nameController.text,
                                              phone: _phoneController.text,
                                              email: _emailController.text,
                                              context: context,
                                              password:
                                                  _passwordController.text);
                                        }
                                      },
                                      child: CustomSubmitButton(
                                        title: 'SIGN UP',
                                        ontap: () {
                                          model.signUp(
                                              name: _nameController.text,
                                              phone: _phoneController.text,
                                              email: _emailController.text,
                                              context: context,
                                              password:
                                                  _passwordController.text);
                                        },

                                        // routeTo: HomeScreen(),
                                      ),
                                    ),
                                    SizedBox(height: 20.h),
                                    Row(
                                      children: [
                                        Text('Have an account?',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xff707070))),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return SignInScreen();
                                                },
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Login.',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xffD10005),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -40.h,
                    child: Container(
                      width: 1.sw,
                      child: Image.asset(
                        'assets/images/AuthScreenBottomImage.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
