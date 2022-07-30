import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget horizontalSpaceTiny = SizedBox(width: 5.w);
Widget horizontalSpaceSmall = SizedBox(width: 10.w);
Widget horizontalSpaceRegular = SizedBox(width: 20.w);
Widget horizontalSpaceMedium = SizedBox(width: 25.w);
Widget horizontalSpaceLarge = SizedBox(width: 50.w);

Widget verticalSpaceTiny = SizedBox(height: 5.h);
Widget verticalSpaceSmall = SizedBox(height: 10.h);
Widget verticalSpaceRegular = SizedBox(height: 20.h);
Widget verticalSpaceMedium = SizedBox(height: 25.h);
Widget verticalSpaceLarge = SizedBox(height: 50.h);

const Duration snackBarDuration =  Duration(seconds: 5);
EdgeInsets get ps8 => EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 8.h,
            );
