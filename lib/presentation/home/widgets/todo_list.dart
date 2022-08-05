import 'package:elred/domain/entities/todo/todo.dart';
import 'package:elred/presentation/home/widgets/todo_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListWidget extends StatelessWidget {
  final List<Todo> todoList;
  const TodoListWidget({Key? key, required this.todoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: todoList.length,
        itemBuilder: ((context, index) =>
            TodoTileWidget(todo: todoList[index])));
  }
}
