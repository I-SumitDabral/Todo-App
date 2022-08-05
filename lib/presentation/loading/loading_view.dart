import 'package:elred/common/config/app_images.dart';
import 'package:elred/presentation/loading/loading_viewmodel.dart';
import 'package:elred/presentation/widgets/lottie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoadingView extends StatelessWidget {
  final Widget? screen;
  final bool manualLoad;
  const LoadingView({Key? key, this.screen, this.manualLoad = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingViewModel>(builder: (_, value, __) {
      return Stack(
        children: [
          screen ?? const SizedBox.shrink(),
          if (value.isLoading || manualLoad)
            Container(
                decoration:
                    BoxDecoration(color: Colors.black45.withOpacity(0.5)),
                alignment: Alignment.center,
                child: _lottieLoader),
        ],
      );
    });
  }

  Widget get _lottieLoader {
    return LottieWidget(
      assetPath: AppImages.loading,
      height: 60.h,
      width: 60.w,
    );
  }
}
