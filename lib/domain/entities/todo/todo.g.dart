// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map<String, dynamic> json) => _$_Todo(
      todoID: json['todoID'] as String,
      todoTitle: json['todoTitle'] as String,
      todoDescription: json['todoDescription'] as String,
      todoDate: json['todoDate'] as int?,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'todoID': instance.todoID,
      'todoTitle': instance.todoTitle,
      'todoDescription': instance.todoDescription,
      'todoDate': instance.todoDate,
      'isCompleted': instance.isCompleted,
    };
