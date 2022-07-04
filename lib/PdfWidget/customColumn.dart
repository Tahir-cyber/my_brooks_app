import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomColumn extends StatefulWidget {
//   CustomColumn({Key? key}) : super(key: key);

//   @override
//   State<CustomColumn> createState() => _CustomColumnState();
// }

// class _CustomColumnState extends State<CustomColumn> {
//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

Widget customColumn(
    {required Widget widgetIcon,
    required VoidCallback ontapRemove,
    required String fileName,
    required String fileSize}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // if (model.file7 != null &&
      //     model.result7!.files.length > 0)
      //   for (int i = 0; i < model.result7!.files.length; i++)
      Row(
        children: [
          widgetIcon,
          // model.result7!.files[i].extension == 'pdf'
          // Icon(
          //     Icons.picture_as_pdf,
          //     color: Colors.grey,
          //   )
          //  Icon(
          //     Icons.image,
          //     color: Colors.grey,
          //   ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: AutoSizeText(
                    fileName,
                    // model.result7!.files[i].name,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              // if (model.file7 != null)
              Text(
                fileSize,
                // model.result7!.files[i].size > 1024
                //     ? '${(model.result7!.files[i].size / 1024 / 1024).toStringAsFixed(2)} MB'
                //     : '${(model.result7!.files[i].size / 1024).toStringAsFixed(2)} KB',
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: ontapRemove,
            // onTap: () {
            //   setState(() {
            //     model.result7!.files.removeAt(i);
            //   });

            //   log("message");
            // },
            child: Card(
              elevation: 3,
              shape: CircleBorder(),
              margin: EdgeInsets.zero,
              child: Icon(
                Icons.close,
                color: Colors.red,
                size: 14.sp,
              ),
            ),
          ),
        ],
      )
    ],
  );
}

Widget elseWidget({required String text, String? subtitle, double? fontSize}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.attach_file_outlined, color: Colors.grey),
        SizedBox(width: 6.w),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            text,
            style: TextStyle(fontSize: fontSize != null ? fontSize.sp : 12.sp),
          ),
          Text(
            subtitle != null ? subtitle : "",
            style: TextStyle(fontSize: 10),
          )
        ])
      ],
    ),
  );
}

Widget removeCardWidget() {
  return Card(
    elevation: 3,
    shape: CircleBorder(),
    margin: EdgeInsets.zero,
    child: Icon(
      Icons.close,
      color: Colors.red,
      size: 14.sp,
    ),
  );
}

Widget fileNameWidget({required text}) {
  return SizedBox(
    child: FittedBox(
      fit: BoxFit.fitWidth,
      child: AutoSizeText(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          color: Colors.grey,
        ),
      ),
    ),
  );
}

Widget iconWidget({required icon}) {
  return Icon(
    icon,
    color: Colors.grey,
  );
}
