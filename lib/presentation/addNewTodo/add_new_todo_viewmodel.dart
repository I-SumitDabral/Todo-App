import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:elred/common/config/app_strings.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/domain/entities/usecases/addTodo_usecase.dart';
import 'package:elred/common/extensions/data_object_extensions.dart';
import 'package:elred/domain/entities/usecases/deletetodo_usecase.dart';
import 'package:elred/domain/entities/usecases/updatetodo_usecase.dart';
import 'package:elred/presentation/loading/loading_viewmodel.dart';
import 'package:elred/presentation/widgets/alert.dart';
import 'package:flutter/material.dart';

class AddNewTodoViewModel extends ChangeNotifier {
  final AddTodoUseCase _addNewTodoUseCase;
  final UpdateTodoUseCase _updateTodoUseCase;
  final LoadingViewModel _loadingViewModel;
  final DeleteTodoUseCase _deleteTodoUseCase;

  AddNewTodoViewModel(this._addNewTodoUseCase, this._updateTodoUseCase,
      this._loadingViewModel, this._deleteTodoUseCase);

  DateTime _dateTime = DateTime.now();
  DateTime get dateTime => _dateTime;
  Future<void> setDateTime(BuildContext context, [DateTime? date]) async {
    if (date != null) {
      _dateTime = date;
      notifyListeners();
      return;
    }
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null) _dateTime = picked;
    notifyListeners();
  }

  Future<void> createNewTodo(
      String title, String description, BuildContext context) async {
    try {
      _setLoading(true);

      final Todo todo = Todo(
          todoID: DateTime.now().millisecondsSinceEpoch.toString(),
          todoTitle: title,
          todoDescription: description,
          todoDate: _dateTime.millisecondsSinceEpoch);
      await Task(() => _addNewTodoUseCase.call(todo))
          .attempt()
          .mapLeftToFailure()
          .run()
          .then((value) => value.fold(
              (l) => _showAlert(context, true, AppStrings.todoFaield),
              (r) => _showAlert(context, false, AppStrings.todoAdded)));
    } finally {
      _setLoading(false);
    }
  }

  Future<void> updateTodo(Todo todo, BuildContext context,
      [bool? isCompleted,
      String? title,
      String? description,
      DateTime? dateTime]) async {
    try {
      _setLoading(true);
      final value = todo.copyWith(
          todoTitle: title ?? todo.todoTitle,
          todoDescription: description ?? todo.todoDescription,
          todoDate: _dateTime.millisecondsSinceEpoch,
          isCompleted: isCompleted ?? todo.isCompleted);
      await Task(() => _updateTodoUseCase.call(value))
          .attempt()
          .mapLeftToFailure()
          .run()
          .then((value) => value.fold(
              (l) => _showAlert(context, true, AppStrings.todoUpdatedFailed),
              (r) => _showAlert(context, false, AppStrings.todoUpdated)));
    } finally {
      _setLoading(false);
    }
  }

  Future<void> deleteTodo(
    String todoID,
    BuildContext context,
  ) async {
    try {
      _setLoading(true);

      await Task(() => _deleteTodoUseCase.call(todoID))
          .attempt()
          .mapLeftToFailure()
          .run()
          .then((value) => value.fold(
              (l) => _showAlert(context, true, AppStrings.tododeleteFailed),
              (r) => _showAlert(context, false, AppStrings.todoDeleted)));
    } finally {
      _setLoading(false);
    }
  }

  void _showAlert(BuildContext context, bool isError, String message) {
    final showAlert = ShowAlert();
    showAlert.show(context, message, isError: isError);
  }

  void _setLoading(bool value) {
    _loadingViewModel.setIsLoading(value);
  }
}
