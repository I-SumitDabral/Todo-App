import 'package:elred/domain/entities/no_params.dart';
import 'package:elred/domain/entities/usecases/current_user_usecase.dart';
import 'package:flutter/cupertino.dart';

class SplashViewModel extends ChangeNotifier {
  final CurrentUserUseCase _currentUserUseCase;

  SplashViewModel(this._currentUserUseCase);
  dynamic _currentUser;
  dynamic get currentUser => _currentUser;
  Future<void> getCurrentUser() async {
    _currentUser = await _currentUserUseCase.call(NoParams());
    notifyListeners();
  }
}
