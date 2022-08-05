import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/presentation/widgets/custom_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ShowAlert {
  void show(BuildContext context, String message,
      {bool isError = false, bool isInfo = false}) {
    showTopSnackBar(
      context,
      isError
          ? CustomSnackBar.error(
              message: message,
              textStyle: Theme.of(context).textTheme.bodyLarge!,
            )
          : isInfo
              ? CustomSnackBar.info(
                  message: message,
                )
              : CustomSnackBar.success(
                  message: message,
                ),
    );
  }

  void showBottomSheet(BuildContext context, Todo todo) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return CustomBottomSheetWidget(todo: todo);
        });
  }
}
