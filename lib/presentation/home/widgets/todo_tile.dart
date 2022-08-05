import 'package:elred/common/extensions/string_extensions.dart';
import 'package:elred/common/extensions/date_extensions.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/presentation/home/widgets/image_icon_widget.dart';
import 'package:elred/presentation/widgets/alert.dart';
import 'package:elred/presentation/widgets/horizontal_spacer_widget.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoTileWidget extends StatelessWidget {
  final Todo todo;
  const TodoTileWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          onTap: () => ShowAlert().showBottomSheet(context, todo),
          leading: const ImageIconWidget(),
          title: TvText(
            todo.todoTitle.intelliTrimOfTitle,
            alignment: TextAlign.left,
            isHeading: true,
            fontSize: 17.sp,
            color: Colors.black54,
          ),
          subtitle: TvText(
            todo.todoDescription.intelliTrimOfSubTitle,
            alignment: TextAlign.left,
            fontSize: 15.sp,
            color: Colors.grey.shade400,
          ),
          trailing: TvText(todo.todoDate?.intToDateString ?? ''),
        ),
        const HorizontalSpacerWidget()
      ],
    );
  }
}
