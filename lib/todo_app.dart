import 'package:elred/common/routes/app_routes.dart';
import 'package:elred/common/routes/page_transitions.dart';
import 'package:elred/common/routes/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 752),
      builder: (context, child) => child ?? const SizedBox(),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.startUpRoute,
        onGenerateRoute: (RouteSettings settings) {
          final routes = Routing.getRoutes(settings);
          final WidgetBuilder? builder = routes[settings.name];
          return FadePageRouteBuilder(
            builder: builder!,
            settings: settings,
          );
        },
      ),
    );
  }
}
