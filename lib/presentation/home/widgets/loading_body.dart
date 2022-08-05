import 'package:elred/common/config/app_images.dart';
import 'package:elred/presentation/widgets/lottie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingBody extends StatelessWidget {
  const LoadingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Center(
                  child: LottieWidget(
                    assetPath: AppImages.loading,
                    height: 60.h,
                    width: 60.w,
                  ),
                );  
  }
}