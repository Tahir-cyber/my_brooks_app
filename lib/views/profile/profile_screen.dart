import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/AuthScreens/sign_in/SignInScreen.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleNo1Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        titleSpacing: 80.w,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(currentUser!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            return snapshot.data != null
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 70.h),
                        Image.asset(
                          'assets/images/logo.png',
                          scale: 2,
                        ),
                        SizedBox(height: 30.h),
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                LogInTextField(
                                    icon: Icons.person,
                                    text: "${snapshot.data!['name']}",
                                    controller: _nameController),
                                SizedBox(height: 20.h),
                                LogInTextField(
                                    icon: Icons.email,
                                    text: "${snapshot.data!['email']}",
                                    controller: _emailController),
                                SizedBox(height: 20.h),
                                LogInTextField(
                                    icon: Icons.phone,
                                    text: "${snapshot.data!['phone']}",
                                    controller: _phoneController),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 40.h),
                        CustomSubmitButton(
                            title: "Logout",
                            ontap: () {
                              FirebaseAuth.instance
                                  .signOut()
                                  .then((value) async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignInScreen(),
                                  ),
                                );
                                SharedPreferences pref =
                                    await SharedPreferences.getInstance();
                                pref.remove("email");
                              });
                            }),
                      ],
                    ),
                  )
                : Scaffold(
                    body: Center(
                      child: LoadingIndicator(
                        colors: [blueColor],
                        indicatorType: Indicator.ballClipRotatePulse,
                        strokeWidth: 1,
                      ),
                    ),
                  );
          }),
    );
  }
}
