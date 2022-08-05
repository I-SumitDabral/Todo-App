import 'package:elred/common/extensions/navigation_extensions.dart';
import 'package:elred/common/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFbButton extends StatelessWidget {
  const CustomFbButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRoutes.addNewTodoRoute),
      child: Container(
        height: 70.h,
        width: 70.h,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 40.sp,
        ),
      ),
    );
  }
}
