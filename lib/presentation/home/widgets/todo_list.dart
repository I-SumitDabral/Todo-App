import 'package:elred/presentation/home/home_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (_, notifier, __) {
      return Container();
      // if (notifier.notifierState == NotifierState.loading) {
      //   return const CircularProgressIndicator();
      // }
    });
  }
}
