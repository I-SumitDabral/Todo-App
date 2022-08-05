import 'dart:async';
import 'package:elred/common/config/app_images.dart';
import 'package:elred/common/routes/app_routes.dart';
import 'package:elred/presentation/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elred/common/extensions/navigation_extensions.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  VideoState createState() => VideoState();
}

class VideoState extends State<Splash> with SingleTickerProviderStateMixin {
  bool _visible = true;
  late SplashViewModel _splashViewModel;
  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    checkIfUserLoggedIn();
  }

  void _navigator(String route) {
    context.pushRemoveUntil(route);
    return;
  }

  void checkIfUserLoggedIn() async {
    final response = await _splashViewModel.currentUser;
    if (response == null) {
      _navigator(AppRoutes.loginRoute);
    } else {
      _navigator(AppRoutes.homeRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _splashViewModel = Provider.of<SplashViewModel>(context, listen: false);
    _splashViewModel.getCurrentUser();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    AppImages.appLogo,
                    height: 25.0,
                    fit: BoxFit.scaleDown,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AppImages.appLogo,
                width: animation.value * 250,
                height: animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
