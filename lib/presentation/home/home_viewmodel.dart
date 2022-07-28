import 'package:dartz/dartz.dart';
import 'package:elred/domain/entities/app_error.dart';
import 'package:elred/domain/entities/no_params.dart';
import 'package:elred/domain/entities/usecases/fetch_todos_usecase.dart';
import 'package:elred/presentation/loading/loading_view.dart';
import 'package:elred/presentation/loading/loading_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:elred/common/extensions/data_object_extensions.dart';

class HomeViewModel extends ChangeNotifier {
  final LoadingViewModel _loadingViewModel;
  final FetchTodosUseCase _fetchTodosUseCase;

  HomeViewModel(this._fetchTodosUseCase, this._loadingViewModel);

  late Either<AppError, dynamic> _todoList;
  Either<AppError, dynamic> get todoList => _todoList;

  void _setTodoList(Either<AppError, dynamic> todos) {
    _todoList = todos;
    notifyListeners();
  }

  Future<void> fetchTodoList() async {
    _loadingViewModel.isLoading = true;
    await Task(() => _fetchTodosUseCase.call(NoParams()))
        .attempt()
        .mapLeftToFailure()
        .run()
        .then((value) => _setTodoList(value));
  }
}
