import 'package:elred/common/config/app_images.dart';
import 'package:elred/common/config/app_strings.dart';
import 'package:elred/data/core/enums/app_error_enums.dart';
import 'package:elred/presentation/widgets/helpers_widget.dart';
import 'package:elred/presentation/widgets/lottie_widget.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyOrErrorWidget extends StatelessWidget {
  final bool isError;
  final AppErrorType? appErrorType;
  const EmptyOrErrorWidget({Key? key, required this.isError, this.appErrorType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ps8,
      child: Column(
        children: [
          verticalSpaceRegular,
          LottieWidget(
              height: 0.5.sh, width: double.infinity, assetPath: getAssetPath),
          verticalSpaceLarge,
          TvText(
            titleText,
            isHeading: true,
            fontSize: 30.sp,
          ),
          verticalSpaceSmall,
          TvText(desText)
        ],
      ),
    );
  }

  String get titleText {
    if (isError) {
      if (appErrorType == AppErrorType.network) {
        return AppStrings.noNet;
      } else {
        return AppStrings.somethingWentWrong;
      }
    } else {
      return AppStrings.addTodo;
    }
  }

  String get desText {
    if (isError) {
      if (appErrorType == AppErrorType.network) {
        return AppStrings.noNetDes;
      } else {
        return AppStrings.des500;
      }
    } else {
      return AppStrings.noTodoDes;
    }
  }

  String get getAssetPath {
    if (isError) {
      if (appErrorType == AppErrorType.network) {
        return AppImages.network;
      } else {
        return AppImages.error500;
      }
    } else {
      return AppImages.empty;
    }
  }
}
