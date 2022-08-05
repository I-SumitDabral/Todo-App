import 'package:dartz/dartz.dart' as d;
import 'package:elred/di/get_it.dart';
import 'package:elred/domain/entities/app_error.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/presentation/home/home_viewmodel.dart';
import 'package:elred/presentation/home/widgets/custom_fb_button.dart';
import 'package:elred/presentation/home/widgets/drawer_widget.dart';
import 'package:elred/presentation/home/widgets/fetched_data_body.dart';
import 'package:elred/presentation/home/widgets/loading_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => getItInstance<HomeViewModel>()),
        StreamProvider<d.Either<AppError, List<Todo>>>.value(
          value: getItInstance<HomeViewModel>().userStream,
          initialData: d.right([]),
        )
      ],
      child: const HomeViewBody(),
    );
  }
}

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late HomeViewModel _homeViewModel;
  @override
  void initState() {
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    _homeViewModel.fetchTodoList();
    super.initState();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();

    super.dispose();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: DrawerWidget(
          onLogoutButtonPressed: () => _homeViewModel.logout(context),
        ),
        floatingActionButton: const CustomFbButton(),
        body: StreamBuilder(
            stream: _homeViewModel.userStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingBody();
              }
              if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (snapshot.hasData) {
                  final List<Todo> rightData = _homeViewModel
                      .getTodo(snapshot.data as d.Either<AppError, List<Todo>>);
                  TodoDone? todo = _homeViewModel.todoDoneData(rightData);
                  return FetchedDataBody(
                      scaffoldKey: _key,
                      todoList: rightData
                          .where((element) => element.isCompleted == false)
                          .toList(),
                      todoDone: todo);
                }
              }
              return const LoadingBody();
            }));
  }
}
