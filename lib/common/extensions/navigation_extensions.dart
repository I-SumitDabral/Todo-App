import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigateTo on BuildContext {
  void get pop => Navigator.pop(this);

  void push(String route, {dynamic arguments}) =>
      Navigator.pushNamed(this, route, arguments: arguments);

  void pushReplace(String route, {dynamic arguments}) =>
      Navigator.pushReplacementNamed(this, route, arguments: arguments);
  void pushRemoveUntil(String route, {dynamic arguments}) =>
      Navigator.pushNamedAndRemoveUntil(
        this,
        route,
        (route) => false,
        arguments: arguments,
      );
}
