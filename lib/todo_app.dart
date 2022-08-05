import 'package:elred/common/routes/app_routes.dart';
import 'package:elred/common/routes/page_transitions.dart';
import 'package:elred/common/routes/routing.dart';
import 'package:elred/di/get_it.dart';
import 'package:elred/presentation/loading/loading_view.dart';
import 'package:elred/presentation/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:elred/presentation/splash/splash_viewmodel.dart';

import 'presentation/addNewTodo/add_new_todo_viewmodel.dart';
import 'presentation/loading/loading_viewmodel.dart';

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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) =>
                  getItInstance<LoadingViewModel>()),
          ChangeNotifierProvider(
              create: (BuildContext context) =>
                  getItInstance<LoginViewModel>()),
         
          ChangeNotifierProvider(
              create: (BuildContext context) =>
                  getItInstance<SplashViewModel>()),
          ChangeNotifierProvider(
              create: (BuildContext context) =>
                  getItInstance<AddNewTodoViewModel>()),
        ],
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.startUpRoute,
          theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.white,
              fontFamily: 'Nunito'),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Stack(
                children: [
                  child ?? const SizedBox.shrink(),
                  const LoadingView(),
                ],
              ),
            );
          },
          onGenerateRoute: (RouteSettings settings) {
            final routes = Routing.getRoutes(settings);
            final WidgetBuilder? builder = routes[settings.name];
            return FadePageRouteBuilder(
              builder: builder!,
              settings: settings,
            );
          },
        ),
      ),
    );
  }
}
