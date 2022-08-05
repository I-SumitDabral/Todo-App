import 'package:elred/common/extensions/navigation_extensions.dart';
import 'package:elred/common/routes/app_routes.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/presentation/addNewTodo/add_new_todo_viewmodel.dart';
import 'package:elred/presentation/home/widgets/image_icon_widget.dart';
import 'package:elred/presentation/widgets/helpers_widget.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elred/common/extensions/date_extensions.dart';
import 'package:provider/provider.dart';

class CustomBottomSheetWidget extends StatelessWidget {
  final Todo todo;
  const CustomBottomSheetWidget({Key? key, required this.todo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddNewTodoViewModel>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
      child: Padding(
        padding: ps8,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const ImageIconWidget(),
                _textBox("title", todo.todoTitle),
                _textBox("description", todo.todoDescription),
                _textBox("date", todo.todoDate?.intToDateString ?? ''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _customIconButton(() {
                      provider.setDateTime(context, todo.todoDate?.intToDate);
                      context.pop;
                      context.push(AppRoutes.addNewTodoRoute, arguments: todo);
                    }, Icons.edit),
                    horizontalSpaceMedium,
                    _customIconButton(() {
                      provider.deleteTodo(todo.todoID, context);
                      context.pop;
                    }, Icons.delete),
                    horizontalSpaceMedium,
                    _customIconButton(() {
                      provider.updateTodo(todo, context, true);
                      context.pop;
                    }, Icons.check),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: _customIconButton(() => context.pop, Icons.close),
            )
          ],
        ),
      ),
    );
  }

  Widget _customIconButton(VoidCallback onPressed, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
          )),
    );
  }

  Widget _textBox(
    String title,
    String value,
  ) {
    return Container(
      margin: ps8,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            TvText(
              "$title : ",
              alignment: TextAlign.left,
              fontSize: 15.sp,
              color: Colors.grey.shade400,
            ),
            TvText(
              value,
              alignment: TextAlign.left,
              fontSize: 15.sp,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
