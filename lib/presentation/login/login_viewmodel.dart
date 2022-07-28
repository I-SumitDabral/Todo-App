import 'package:elred/domain/entities/usecases/login_usescase.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  void attemptLogin() {
    _loginUseCase.call({});
  }
}
