import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool isDisabled;
  final VoidCallback onPressed;
  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      required this.isDisabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isDisabled ? null : onPressed,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5.r),
        child: Container(
          alignment: Alignment.center,
          height: 50.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: isDisabled ? Colors.grey : const Color(0xff2ebaef),
              borderRadius: BorderRadius.circular(5.r)),
          child: TvText(
            buttonText,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
