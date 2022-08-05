// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

/// @nodoc
mixin _$Todo {
  String get todoID => throw _privateConstructorUsedError;
  String get todoTitle => throw _privateConstructorUsedError;
  String get todoDescription => throw _privateConstructorUsedError;
  int? get todoDate => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res>;
  $Res call(
      {String todoID,
      String todoTitle,
      String todoDescription,
      int? todoDate,
      bool isCompleted});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  final Todo _value;
  // ignore: unused_field
  final $Res Function(Todo) _then;

  @override
  $Res call({
    Object? todoID = freezed,
    Object? todoTitle = freezed,
    Object? todoDescription = freezed,
    Object? todoDate = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_value.copyWith(
      todoID: todoID == freezed
          ? _value.todoID
          : todoID // ignore: cast_nullable_to_non_nullable
              as String,
      todoTitle: todoTitle == freezed
          ? _value.todoTitle
          : todoTitle // ignore: cast_nullable_to_non_nullable
              as String,
      todoDescription: todoDescription == freezed
          ? _value.todoDescription
          : todoDescription // ignore: cast_nullable_to_non_nullable
              as String,
      todoDate: todoDate == freezed
          ? _value.todoDate
          : todoDate // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$$_TodoCopyWith(_$_Todo value, $Res Function(_$_Todo) then) =
      __$$_TodoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String todoID,
      String todoTitle,
      String todoDescription,
      int? todoDate,
      bool isCompleted});
}

/// @nodoc
class __$$_TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res>
    implements _$$_TodoCopyWith<$Res> {
  __$$_TodoCopyWithImpl(_$_Todo _value, $Res Function(_$_Todo) _then)
      : super(_value, (v) => _then(v as _$_Todo));

  @override
  _$_Todo get _value => super._value as _$_Todo;

  @override
  $Res call({
    Object? todoID = freezed,
    Object? todoTitle = freezed,
    Object? todoDescription = freezed,
    Object? todoDate = freezed,
    Object? isCompleted = freezed,
  }) {
    return _then(_$_Todo(
      todoID: todoID == freezed
          ? _value.todoID
          : todoID // ignore: cast_nullable_to_non_nullable
              as String,
      todoTitle: todoTitle == freezed
          ? _value.todoTitle
          : todoTitle // ignore: cast_nullable_to_non_nullable
              as String,
      todoDescription: todoDescription == freezed
          ? _value.todoDescription
          : todoDescription // ignore: cast_nullable_to_non_nullable
              as String,
      todoDate: todoDate == freezed
          ? _value.todoDate
          : todoDate // ignore: cast_nullable_to_non_nullable
              as int?,
      isCompleted: isCompleted == freezed
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Todo extends _Todo {
  const _$_Todo(
      {required this.todoID,
      required this.todoTitle,
      required this.todoDescription,
      required this.todoDate,
      this.isCompleted = false})
      : super._();

  factory _$_Todo.fromJson(Map<String, dynamic> json) => _$$_TodoFromJson(json);

  @override
  final String todoID;
  @override
  final String todoTitle;
  @override
  final String todoDescription;
  @override
  final int? todoDate;
  @override
  @JsonKey()
  final bool isCompleted;

  @override
  String toString() {
    return 'Todo(todoID: $todoID, todoTitle: $todoTitle, todoDescription: $todoDescription, todoDate: $todoDate, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Todo &&
            const DeepCollectionEquality().equals(other.todoID, todoID) &&
            const DeepCollectionEquality().equals(other.todoTitle, todoTitle) &&
            const DeepCollectionEquality()
                .equals(other.todoDescription, todoDescription) &&
            const DeepCollectionEquality().equals(other.todoDate, todoDate) &&
            const DeepCollectionEquality()
                .equals(other.isCompleted, isCompleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(todoID),
      const DeepCollectionEquality().hash(todoTitle),
      const DeepCollectionEquality().hash(todoDescription),
      const DeepCollectionEquality().hash(todoDate),
      const DeepCollectionEquality().hash(isCompleted));

  @JsonKey(ignore: true)
  @override
  _$$_TodoCopyWith<_$_Todo> get copyWith =>
      __$$_TodoCopyWithImpl<_$_Todo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoToJson(
      this,
    );
  }
}

abstract class _Todo extends Todo {
  const factory _Todo(
      {required final String todoID,
      required final String todoTitle,
      required final String todoDescription,
      required final int? todoDate,
      final bool isCompleted}) = _$_Todo;
  const _Todo._() : super._();

  factory _Todo.fromJson(Map<String, dynamic> json) = _$_Todo.fromJson;

  @override
  String get todoID;
  @override
  String get todoTitle;
  @override
  String get todoDescription;
  @override
  int? get todoDate;
  @override
  bool get isCompleted;
  @override
  @JsonKey(ignore: true)
  _$$_TodoCopyWith<_$_Todo> get copyWith => throw _privateConstructorUsedError;
}
