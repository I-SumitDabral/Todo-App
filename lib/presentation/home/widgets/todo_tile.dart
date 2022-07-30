import 'package:elred/presentation/widgets/horizontal_spacer_widget.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoTileWidget extends StatelessWidget {
  const TodoTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          // height: 0.1.sh,
          // color: Colors.blue,
          leading: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.grey)),
            height: 60.h,
            width: 60.w,
          ),
          title: TvText(
            "This is my title",
            alignment: TextAlign.left,
            isHeading: true,
            fontSize: 20.sp,
            color: Colors.black54,
          ),
          subtitle: TvText(
            "this is my response",
            alignment: TextAlign.left,
            fontSize: 15.sp,
            color: Colors.grey.shade400,
          ),
          trailing: TvText("9am"),
        ),
        HorizontalSpacerWidget()
      ],
    );
  }
}
