import 'package:elred/common/config/app_images.dart';
import 'package:elred/common/config/app_strings.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/presentation/addNewTodo/add_new_todo_viewmodel.dart';
import 'package:elred/presentation/addNewTodo/widgets/custom_button.dart';
import 'package:elred/presentation/addNewTodo/widgets/textfield.dart';
import 'package:elred/presentation/home/widgets/image_icon_widget.dart';
import 'package:elred/presentation/widgets/helpers_widget.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:elred/common/extensions/date_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddNewTodoView extends StatefulWidget {
  final Todo? todo;
  const AddNewTodoView({Key? key, this.todo}) : super(key: key);

  @override
  State<AddNewTodoView> createState() => _AddNewTodoViewState();
}

class _AddNewTodoViewState extends State<AddNewTodoView> {
  final _formKey = GlobalKey<FormState>();

  late final AddNewTodoViewModel _addNewTodoViewModel;
  Todo? get _todo => widget.todo;
  late final TextEditingController _titleController;
  late final TextEditingController _desController;
  late final FocusNode _titleFocus;
  late final FocusNode _desFocus;
  late final FocusNode _dateFocus;
  @override
  void initState() {
    _titleFocus = FocusNode();
    _desFocus = FocusNode();
    _dateFocus = FocusNode();
    _addNewTodoViewModel =
        Provider.of<AddNewTodoViewModel>(context, listen: false);

    _titleController = TextEditingController(text: _todo?.todoTitle);

    _desController = TextEditingController(text: _todo?.todoDescription);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.clear();
    _desController.clear();
    _titleController.dispose();
    _desController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff46539e),
      appBar: _customAppBar,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const ImageIconWidget(),
              verticalSpaceMedium,
              CustomTextFieldWidget(
                focusNode: _titleFocus,
                hintText:
                    _todo == null ? AppStrings.title : AppStrings.updateTodo,
                textEditingController: _titleController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.titleNotEmpty;
                  }
                  return null;
                },
              ),
              verticalSpaceRegular,
              CustomTextFieldWidget(
                focusNode: _desFocus,
                hintText: AppStrings.description,
                textEditingController: _desController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.desNotEmpty;
                  }
                  return null;
                },
              ),
              verticalSpaceRegular,
              Consumer<AddNewTodoViewModel>(builder: ((context, value, child) {
                return CustomTextFieldWidget(
                  focusNode: _dateFocus,
                  hintText: AppStrings.date,
                  textEditingController:
                      TextEditingController(text: value.dateTime.dateTostring),
                  onTapped: () => _addNewTodoViewModel.setDateTime(context),
                );
              })),
              verticalSpaceLarge,
              CustomButton(
                  isDisabled: false,
                  buttonText: (_todo == null
                          ? AppStrings.addTodo
                          : AppStrings.updateTodo)
                      .toUpperCase(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final title = _titleController.text;
                      final des = _desController.text;
                      if (_todo != null) {
                        _addNewTodoViewModel.updateTodo(
                            _todo!, context, false, title, des);
                      } else {
                        _addNewTodoViewModel.createNewTodo(title, des, context);
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  IconButton get _iconButton {
    return IconButton(
        onPressed: () {
          _addNewTodoViewModel.setDateTime(context);
        },
        icon: Image.asset(
          AppImages.drawer,
          color: Colors.white,
        ));
  }

  AppBar get _customAppBar => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: TvText(
          _todo == null ? AppStrings.addTodo : AppStrings.updateTodo,
          color: Colors.white,
        ),
        actions: [_iconButton],
      );
}
