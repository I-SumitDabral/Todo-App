import 'package:elred/common/routes/app_routes.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/presentation/addNewTodo/add_new_todo_screen.dart';
import 'package:elred/presentation/home/home_view.dart';
import 'package:elred/presentation/login/login_view.dart';
import 'package:elred/presentation/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';

mixin Routing {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        AppRoutes.startUpRoute: ((context) => const Splash()),
        AppRoutes.addNewTodoRoute: ((context) => AddNewTodoView(
              todo: setting.arguments as Todo?,
            )),
        AppRoutes.loginRoute: ((context) => LoginView()),
        AppRoutes.homeRoute: ((context) => const HomeView()),
      };
}
