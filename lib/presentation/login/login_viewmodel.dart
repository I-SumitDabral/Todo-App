import 'package:elred/common/config/app_strings.dart';
import 'package:elred/common/extensions/navigation_extensions.dart';
import 'package:elred/common/routes/app_routes.dart';
import 'package:elred/domain/entities/no_params.dart';
import 'package:elred/domain/entities/usecases/login_usescase.dart';
import 'package:elred/presentation/loading/loading_viewmodel.dart';
import 'package:elred/presentation/widgets/alert.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  final LoadingViewModel _loadingViewModel;

  LoginViewModel(this._loginUseCase, this._loadingViewModel);
  final ShowAlert _showAlert = ShowAlert();
  Future<void> attemptLogin(BuildContext context) async {
    try {
      _loadingViewModel.setIsLoading(true);
      final response = await _loginUseCase.call(NoParams());
      response.fold(
          (l) => _showAlert.show(context, AppStrings.somethingWentWrong),
          (r) => context.pushReplace(AppRoutes.homeRoute));
    } finally {
      _loadingViewModel.setIsLoading(false);
    }
  }
}
