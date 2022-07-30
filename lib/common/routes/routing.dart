import 'package:elred/common/routes/app_routes.dart';
import 'package:elred/presentation/addNewTodo/add_new_todo_screen.dart';
import 'package:elred/presentation/home/home_view.dart';
import 'package:elred/presentation/login/login_view.dart';
import 'package:elred/presentation/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';

mixin Routing {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        AppRoutes.startUpRoute: ((context) => Splash()),
        AppRoutes.addNewTodoRoute: ((context) => AddNewTodoScreen()),
        AppRoutes.loginRoute: ((context) => LoginView()),
        AppRoutes.homeRoute: ((context) => HomeView()),
      };
}
