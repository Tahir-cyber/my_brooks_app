import 'package:brooks/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ApprovedFormScreen.dart';
import 'LookingForFundScreen.dart';
import 'NonApprovedFormsScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, right: 10.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                        },
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Color(0xff0E3793),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Image.asset(
                        'assets/images/logo.png',
                        scale: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                HomeScreenButtonWidget(
                  routeto: LookingForFundsScreen(),
                  title: 'Looking for funding',
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dapibus ac libero id blandit',
                  image: 'assets/images/fund.png',
                  icons: Icons.arrow_forward,
                ),
                SizedBox(height: 30),
                HomeScreenButtonWidget(
                  routeto: ApprovedFormScreen(),
                  title: 'Approved form',
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dapibus ac libero id blandit',
                  image: 'assets/images/approved.png',
                  icons: Icons.arrow_forward,
                ),
                SizedBox(height: 30),
                HomeScreenButtonWidget(
                  routeto: NonApprovedFormsScreen(),
                  title: 'Pending Form',
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dapibus ac libero id blandit',
                  image: 'assets/images/file.png',
                  icons: Icons.arrow_forward,
                ),
                SizedBox(height: 30),
                HomeScreenButtonWidget(
                  routeto: NonApprovedFormsScreen(),
                  title: 'Non Approved form',
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam dapibus ac libero id blandit',
                  image: 'assets/images/rejected.png',
                  icons: Icons.arrow_forward,
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreenButtonWidget extends StatelessWidget {
  final String title;
  final String text;
  final IconData icons;
  final String image;
  final Widget routeto;
  HomeScreenButtonWidget({
    required this.icons,
    required this.routeto,
    required this.image,
    required this.text,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return routeto;
          }),
        );
      },
      child: Container(
        width: 304.w,
        height: 110.h,
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        child: Padding(
          padding: EdgeInsets.only(top: 5, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, color: Color(0xff0E3793)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      image,
                      scale: 4,
                    ),
                  )
                ],
              ),
              Text(text),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      icons,
                      color: Color(0xffD10005),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6,
              spreadRadius: 0.1,
              offset: Offset(0, 3),
            )
          ],
        ),
      ),
    );
  }
}
