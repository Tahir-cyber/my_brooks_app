import 'dart:typed_data';

import 'package:brooks/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignatureWidget extends StatelessWidget {
  final String title;
  final Uint8List? signature;
  final double? width;
  final double? height;
  final double? titleFontSize;
  final double? sizedBoxHeight;
  TextEditingController? controller = TextEditingController();

  SignatureWidget({
    this.signature,
    required this.title,
    this.titleFontSize,
    this.height,
    this.width,
    this.controller,
    this.sizedBoxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: titleFontSize == null ? 12.sp : titleFontSize,
                color: blackColor,
              ),
            ),
          ),
          SizedBox(height: sizedBoxHeight == null ? 5.h : sizedBoxHeight),
          Container(
            width: width == null ? 304.w : width,
            height: signature == null
                ? height == null
                    ? 50.h
                    : height
                : 200.h,
            padding: EdgeInsets.symmetric(vertical: 5.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: greyColor.withOpacity(0.1),
            ),
            child: signature == null
                ? Center(child: Text("Tap to create Signature"))
                : Padding(
                    padding: EdgeInsets.all(5.h),
                    child: Image.memory(
                      signature!,
                      filterQuality: FilterQuality.high,
                      // scale: 5,
                      fit: BoxFit.contain,
                      width: 200.w,
                      height: 200.h,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

Widget signatureButton(
    {required String title, required VoidCallback onPressed}) {
  return TextButton(onPressed: onPressed, child: Text(title));
}
