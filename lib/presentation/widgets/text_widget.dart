import 'package:flutter/material.dart';

class TvText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? alignment;
  final Color? bgColor;
  final Color? color;
  final bool isBody;
  final bool isHeading;
  final bool isButton;
  final double? fontSize;

  const TvText(
    this.text, {
    Key? key,
    this.style,
    this.alignment,
    this.isBody = false,
    this.isHeading = false,
    this.isButton = false,
    this.bgColor,
    this.color,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? _getTheme(context),
      textAlign: alignment ?? TextAlign.center,
    );
  }

  TextStyle? _getTheme(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    late final TextStyle? newTheme;
    if (isBody) {
      newTheme = theme.bodyText2;
    } else if (isHeading) {
      newTheme = theme.headline6!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
    } else {
      newTheme = theme.button;
    }
    return newTheme!.copyWith(
      backgroundColor: bgColor,
      color: color,
      fontSize: fontSize,
    );
  }
}
