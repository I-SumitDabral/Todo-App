import 'package:elred/common/config/app_images.dart';
import 'package:elred/presentation/widgets/helpers_widget.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerWidget extends StatelessWidget {
  final VoidCallback onLogoutButtonPressed;
  const DrawerWidget({Key? key, required this.onLogoutButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DrawerHeader(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40.r,
                backgroundImage: const AssetImage(AppImages.appLogo),
              ),
              verticalSpaceRegular,
             const TvText("Sumit Kumar"),
              const TvText("sumitdabral987@gmail.com"),
            ],
          )),
          ElevatedButton(
              onPressed: onLogoutButtonPressed, child: const TvText("Logout")),
          verticalSpaceLarge
        ],
      ),
    );
  }
}
