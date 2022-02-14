import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

@immutable
class Todo extends Equatable {
  Todo({
    String? id,
    required this.title,
    String? description,
    this.completed = false,
  })  : id = id ?? const Uuid().v4(),
        description = description ?? "";

  final String? id;
  final String title;
  final String? description;
  final bool completed;

  @override
  List<Object?> get props => [id, title, description, completed];
}
