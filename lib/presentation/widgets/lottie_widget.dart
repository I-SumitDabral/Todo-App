import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  final double height;
  final double width;
  final String assetPath;
  const LottieWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.assetPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      assetPath,
      height: height,
      width: width,
    );
  }
}
