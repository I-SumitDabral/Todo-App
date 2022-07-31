import 'package:elred/common/config/app_images.dart';
import 'package:elred/presentation/addNewTodo/widgets/textfield.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddNewTodoScreen extends StatelessWidget {
  const AddNewTodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: TvText(
          "Add new todo",
          color: Colors.white,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                AppImages.drawer,
                color: Colors.white,
              ))
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.grey)),
            height: 60.h,
            width: 60.w,
          ),
          CustomTextFieldWidget(
            textEditingController: TextEditingController(),
          ),
          CustomTextFieldWidget(
            textEditingController: TextEditingController(),
          ),
          CustomTextFieldWidget(
            textEditingController: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
