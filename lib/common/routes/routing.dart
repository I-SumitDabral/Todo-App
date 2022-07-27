import 'package:elred/common/routes/app_routes.dart';
import 'package:elred/presentation/addNewTodo/add_new_todo_screen.dart';
import 'package:elred/presentation/home/home_screen.dart';
import 'package:flutter/cupertino.dart';

mixin Routing {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        AppRoutes.startUpRoute: ((context) => HomeScreen()),
        AppRoutes.addNewTodoRoute: ((context) => AddNewTodoScreen()),
      };
}
