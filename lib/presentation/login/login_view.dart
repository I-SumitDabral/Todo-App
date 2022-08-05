import 'package:elred/common/config/app_images.dart';
import 'package:elred/common/config/app_strings.dart';
import 'package:elred/presentation/login/login_viewmodel.dart';
import 'package:elred/presentation/login/widgets/login_body_widgets.dart';
import 'package:elred/presentation/widgets/lottie_widget.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  late LoginViewModel _loginViewModel;

  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _lottieLoader,
        const LoginBodyWidgets(),
        ElevatedButton(
            onPressed: () async {
              await _loginViewModel.attemptLogin(context);
            },
            child: const TvText(
              AppStrings.getStarted,
              isButton: true,
            ))
      ]),
    );
  }

  Widget get _lottieLoader {
    return LottieWidget(
      assetPath: AppImages.todoGif,
      height: 0.6.sh,
      width: double.infinity,
    );
  }
}
