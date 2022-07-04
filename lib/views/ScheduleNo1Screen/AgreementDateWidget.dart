import 'package:brooks/constants/Colors.dart';
import 'package:brooks/views/ScheduleNo1Screen/ScheduleScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AgreementDateWidget extends StatefulWidget {
  final String title;
  final double? width;
  final Color? titleColor;
  int state;

  AgreementDateWidget({
    required this.title,
    this.width,
    this.titleColor,
    this.state = 1,
  });

  @override
  State<AgreementDateWidget> createState() => _AgreementDateWidgetState();
}

class _AgreementDateWidgetState extends State<AgreementDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.roboto(
                color:
                    widget.titleColor == null ? redColor : widget.titleColor),
          ),
          GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(context,
                  theme: DatePickerTheme(
                    backgroundColor: blackColor,
                    headerColor: blueColor,
                    doneStyle: TextStyle(color: whiteColor),
                    cancelStyle: TextStyle(color: whiteColor),
                    itemStyle: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                  showTitleActions: true,
                  minTime: DateTime(1900, 1, 1),
                  maxTime: DateTime(2024, 30, 12), onConfirm: (date) {
                setState(() {
                  if (widget.state == 1) {
                    celebrityScheduleDate =
                        DateFormat('EEE, MMM d, ' 'yyyy').format(date);
                  } else if (widget.state == 2) {
                    celebrityScheduleDate2 =
                        DateFormat('EEE, MMM d, ' 'yyyy').format(date);
                  } else if (widget.state == 3) {
                    creditRealseScreen =
                        DateFormat('EEE, MMM d, ' 'yyyy').format(date);
                  }
                });
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Container(
              width: widget.width == null ? 304.w : widget.width,
              height: 38.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: greyColor.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10.w),
                  FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        widget.state == 1
                            ? celebrityScheduleDate
                            : widget.state == 3
                                ? creditRealseScreen
                                : celebrityScheduleDate2,
                        style: TextStyle(fontSize: 12.sp),
                      )),
                  Spacer(),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

String confidentialScreenDate = "DD/MM/YYYY";
String sheduleScreenDate = "DD/MM/YYYY";

class AgreementDateWidget2 extends StatefulWidget {
  final String title;
  final double? width;
  final Color? titleColor;
  final int? state;

  AgreementDateWidget2(
      {required this.title, this.width, this.titleColor, required this.state});

  @override
  State<AgreementDateWidget2> createState() => _AgreementDateWidget2State();
}

class _AgreementDateWidget2State extends State<AgreementDateWidget2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.roboto(
                color:
                    widget.titleColor == null ? redColor : widget.titleColor),
          ),
          GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(context,
                  theme: DatePickerTheme(
                    backgroundColor: blackColor,
                    headerColor: blueColor,
                    doneStyle: TextStyle(color: whiteColor),
                    cancelStyle: TextStyle(color: whiteColor),
                    itemStyle: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                  showTitleActions: true,
                  minTime: DateTime(1900, 1, 1),
                  maxTime: DateTime(2024, 30, 12), onConfirm: (date) {
                setState(() {
                  widget.state == 1
                      ? confidentialScreenDate =
                          DateFormat('EEE, MMM d, ' 'yyyy').format(date)
                      : sheduleScreenDate =
                          DateFormat('EEE, MMM d, ' 'yyyy').format(date);
                });
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Container(
              width: widget.width == null ? 304.w : widget.width,
              height: 38.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: greyColor.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10.w),
                  Text(
                    widget.state == 1
                        ? confidentialScreenDate
                        : sheduleScreenDate,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



String fnstatementDate = "DD/MM/YYYY";
String fnstatementDate2 = "DD/MM/YYYY";
class AgreementDateWidget3 extends StatefulWidget {
  final String title;
  final double? width;
  final Color? titleColor;
  final int? state;

  AgreementDateWidget3(
      {required this.title, this.width, this.titleColor, required this.state});

  @override
  State<AgreementDateWidget3> createState() => _AgreementDateWidget3State();
}

class _AgreementDateWidget3State extends State<AgreementDateWidget3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.roboto(
                color:
                    widget.titleColor == null ? redColor : widget.titleColor),
          ),
          GestureDetector(
            onTap: () {
              DatePicker.showDatePicker(context,
                  theme: DatePickerTheme(
                    backgroundColor: blackColor,
                    headerColor: blueColor,
                    doneStyle: TextStyle(color: whiteColor),
                    cancelStyle: TextStyle(color: whiteColor),
                    itemStyle: TextStyle(
                      color: whiteColor,
                    ),
                  ),
                  showTitleActions: true,
                  minTime: DateTime(1900, 1, 1),
                  maxTime: DateTime(2024, 30, 12), onConfirm: (date) {
                setState(() {
                  widget.state == 1
                      ? fnstatementDate =
                          DateFormat('EEE, MMM d, ' 'yyyy').format(date)
                      : fnstatementDate2 =
                          DateFormat('EEE, MMM d, ' 'yyyy').format(date);
                });
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            },
            child: Container(
              width: widget.width == null ? 304.w : widget.width,
              height: 38.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: greyColor.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10.w),
                  Text(
                    widget.state == 1
                        ? fnstatementDate
                        : fnstatementDate2,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
