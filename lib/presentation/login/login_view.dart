import 'package:elred/common/config/app_images.dart';
import 'package:elred/common/config/app_strings.dart';
import 'package:elred/presentation/login/login_viewmodel.dart';
import 'package:elred/presentation/login/widgets/login_body_widgets.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.asset(
          AppImages.todoGif,
          height: 0.6.sh,
        ),
        const LoginBodyWidgets(),
        Consumer<LoginViewModel>(
            builder: (_, viewModel, __) => ElevatedButton(
                onPressed: () {
                  viewModel.attemptLogin();
                },
                child: const TvText(
                  AppStrings.getStarted,
                  isButton: true,
                )))
      ]),
    );
  }
}
