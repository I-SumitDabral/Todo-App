import 'package:elred/common/config/app_strings.dart';
import 'package:elred/presentation/widgets/helpers_widget.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBodyWidgets extends StatelessWidget {
  const LoginBodyWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ps8,
      child: Column(
        children: [
          TvText(
            AppStrings.welcome,
            fontSize: 30.sp,
            isHeading: true,
          ),
          verticalSpaceTiny,
          TvText(
            AppStrings.welcomeDes,
            isBody: true,
            fontSize: 15.sp,
          ),
        ],
      ),
    );
  }
}
