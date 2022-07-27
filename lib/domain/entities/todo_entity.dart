import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final String todoID;
  final String todoTitle;
  final String todoDescription;
  final DateTime todoDate;
  final DateTime todoTime;
  final bool isCompleted;
  final bool isDeleted;
  final String type;

  const TodoEntity(
      this.todoID,
      this.todoTitle,
      this.todoDescription,
      this.todoDate,
      this.todoTime,
      this.isCompleted,
      this.isDeleted,
      this.type);

  @override
  List<Object?> get props => [todoID];
}
