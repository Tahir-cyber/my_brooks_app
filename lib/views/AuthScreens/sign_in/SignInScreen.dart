import 'package:brooks/views/AuthScreens/sign_in/sign_in_viewmodel.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import '../../../constants/Colors.dart';
import '../signup/SignUpScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<SignInViewModel>(builder: (context, model, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                width: 1.sw,
                child: Column(
                  children: [
                    SizedBox(height: 70.h),
                    Image.asset(
                      'assets/images/logo.png',
                      scale: 1.5,
                    ),
                    SizedBox(height: 50.h),
                    Container(
                      width: 280.w,
                      height: 320.h,
                      padding: EdgeInsets.only(left: 20.w),
                      child: model.loading
                          ? AlertDialog(
                              content: Center(
                                child: LoadingIndicator(
                                  colors: [blueColor],
                                  indicatorType: Indicator.ballClipRotatePulse,
                                  strokeWidth: 1,
                                ),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome Back',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: greyColor,
                                  ),
                                ),
                                Text(
                                  'Login to your account',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: greyColor,
                                  ),
                                ),
                                SizedBox(height: 15.h),
                                LogInTextField(
                                  inputType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  text: 'Email',
                                  icon: Icons.email,
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
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Forget password?',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xffFF6565),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 27),
                                CustomSubmitButton(
                                  title: 'LOGIN',
                                  ontap: () {
                                    if (_formKey.currentState!.validate()) {
                                      model.logIn(_emailController.text,
                                          _passwordController.text, context);
                                    }
                                    _emailController.clear();
                                    _passwordController.clear();
                                  },
                                  // routeTo: HomeScreen(),
                                ),
                                SizedBox(height: 32),
                                Row(
                                  children: [
                                    Text(
                                      'Newbie Here?',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: greyColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return SignUpScreen();
                                            },
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'SIGN UP',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: redColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                    ),
                    Container(
                      width: 1.sw,
                      child: Image.asset(
                        'assets/images/AuthScreenBottomImage.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class LogInTextField extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;
  TextInputType? inputType;
  final FormFieldValidator<String>? validator;

  LogInTextField(
      {required this.icon,
      required this.text,
      required this.controller,
      this.inputType,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: blueColor.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11),
                  bottomLeft: Radius.circular(11))),
          height: 38.h,
          width: 8.w,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xffF0F0F0),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(11),
                  bottomRight: Radius.circular(11))),
          height: 38.h,
          width: 240.w,
          child: Row(
            children: [
              SizedBox(width: 10.w),
              Icon(
                icon,
                size: 20,
                color: greyColor.withOpacity(0.6),
              ),
              SizedBox(width: 10.w),
              Container(
                width: 200.w,
                child: TextFormField(
                  keyboardType: inputType,
                  validator: validator,
                  controller: controller,
                  cursorColor: Colors.black,
                  decoration:
                      InputDecoration(border: InputBorder.none, hintText: text),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
