import 'package:elred/presentation/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Consumer<LoginViewModel>(
              builder: (_, viewModel, __) => TextButton(
                  onPressed: () {
                    viewModel.attemptLogin();
                  },
                  child: const Text("Google Sign In"))),
        )
      ]),
    );
  }
}
