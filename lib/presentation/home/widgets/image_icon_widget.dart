import 'package:elred/common/config/app_images.dart';
import 'package:elred/presentation/widgets/helpers_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageIconWidget extends StatelessWidget {
  const ImageIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2.0,
            color: Colors.grey,
          )),
      height: 80.h,
      width: 80.w,
      alignment: Alignment.center,
      child: Padding(
        padding: ps8,
        child: Image.asset(
          AppImages.todo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
