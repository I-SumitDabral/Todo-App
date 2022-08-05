import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:elred/common/routes/app_routes.dart';
import 'package:elred/domain/entities/app_error.dart';
import 'package:elred/domain/entities/no_params.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/common/extensions/navigation_extensions.dart';
import 'package:elred/domain/entities/usecases/fetch_todos_usecase.dart';
import 'package:elred/domain/entities/usecases/logout_usecase.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {
  final FetchTodosUseCase _fetchTodosUseCase;
  final LogoutUseCase _logoutUseCase;

  HomeViewModel(this._fetchTodosUseCase, this._logoutUseCase);

  final StreamController<Either<AppError, List<Todo>>> _controller =
      StreamController<Either<AppError, List<Todo>>>();
  Stream<Either<AppError, List<Todo>>>? get userStream =>
      _controller.stream.asBroadcastStream();
  void dispose() {
    _controller.close();
  }

  Future<void> fetchTodoList() async {
    try {
      StreamSubscription<Either<AppError, List<Todo>>>? response;
      response?.cancel();
      response = _fetchTodosUseCase.call(NoParams()).listen((event) {
        _controller.sink.add(event);
      });
    } finally {}
  }

  Future<void> logout(BuildContext context) async {
    final response = await _logoutUseCase.call(NoParams());
    response.fold(
        (l) => null, (r) => context.pushReplace(AppRoutes.loginRoute));
  }

  List<Todo> getTodo(Either<AppError, List<Todo>> data) {
    return data.fold((l) => <Todo>[], (r) => r);
  }

  TodoDone? todoDoneData(List<Todo> data) {
    if (data.isEmpty) {
      return null;
    }
    int total = data.length;
    int totalDone = 0;
    for (final value in data) {
      if (value.isCompleted) {
        totalDone++;
      }
    }
    final percentageDone = ((totalDone / total) * 100).round();
    final todoDone = TodoDone(totalDone, total, percentageDone);
    return todoDone;
  }
}

class TodoDone {
  final int totalDone;
  final int total;
  final int percentageDone;

  TodoDone(this.totalDone, this.total, this.percentageDone);
}
