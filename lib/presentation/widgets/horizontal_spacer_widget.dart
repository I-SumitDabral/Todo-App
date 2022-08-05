import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSpacerWidget extends StatelessWidget {
  const HorizontalSpacerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 0.85.sw,
      color: Colors.grey.shade300,
    );
  }
}
