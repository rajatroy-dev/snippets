import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

@immutable
class Todo extends Equatable {
  Todo({
    String? id,
    required this.title,
    this.completed = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id cannot be null & should be empty',
        ),
        id = id ?? const Uuid().v4();

  final String? id;
  final String title;
  final bool completed;

  Todo copyWith({
    String? id,
    String? title,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object?> get props => [id, title, completed];
}
