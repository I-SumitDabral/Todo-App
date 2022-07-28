import 'package:elred/presentation/loading/loading_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingViewModel>(
      builder: (_, value, __) {
        if (value.isLoading == true) {
          return const CircularProgressIndicator();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
