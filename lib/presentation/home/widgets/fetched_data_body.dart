import 'package:elred/common/config/app_images.dart';
import 'package:elred/common/config/app_strings.dart';
import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/presentation/home/home_viewmodel.dart';
import 'package:elred/presentation/widgets/emptyOrErrorWidget.dart';
import 'package:elred/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'todo_list.dart';
import 'top_layer_widget.dart';

class FetchedDataBody extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final List<Todo> todoList;
  final TodoDone? todoDone;
  const FetchedDataBody(
      {Key? key,
      required this.scaffoldKey,
      required this.todoList,
      this.todoDone})
      : super(key: key);

  @override
  State<FetchedDataBody> createState() => _FetchedDataBodyState();
}

class _FetchedDataBodyState extends State<FetchedDataBody> {
  @override
  Widget build(BuildContext context) {
    if (widget.todoList.isEmpty) {
      return const EmptyOrErrorWidget(isError: false);
    }
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
          title: _topAppBar,
          snap: false,
          pinned: true,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: ToplayerWidget(
              todoDone: widget.todoDone,
            ),
          ),
          expandedHeight: 0.33.sh,
        ),
        SliverToBoxAdapter(
          child: TodoListWidget(todoList: widget.todoList),
        )
      ],
    );
  }

  Widget get _topAppBar {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            onTap: () => widget.scaffoldKey.currentState?.openDrawer(),
            child: Image.asset(
              AppImages.drawer,
              color: Colors.white,
              height: 30,
            ),
          ),
        ),
      ],
    );
  }
}
