import 'package:brooks/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UploadDocumentWidget3 extends StatelessWidget {
  final Widget? Column;

  final String? subtitle;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final VoidCallback? onTap;

  UploadDocumentWidget3({
    this.Column,
    this.subtitle,
    this.subtitleFontSize,
    this.onTap,
    this.titleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 0,
      color: greyColor.withOpacity(0.2),
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        child: Row(
          children: [
            Column!,
            Spacer(),
            Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: greyColor,
                    spreadRadius: 0.1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: GestureDetector(
                    onTap: onTap, child: Icon(Icons.file_upload_outlined)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
