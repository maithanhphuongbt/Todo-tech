import 'package:meta/meta.dart';
import 'package:todo_tech/core/models/task.dart';

@immutable
class TasksState {
  final bool isError;
  final bool isLoading;
  final List<Task> tasks;

  TasksState({
    this.isError,
    this.isLoading,
    this.tasks,
  });

  factory TasksState.initial() => TasksState(
        isLoading: false,
        isError: false,
        tasks: const [],
      );

  TasksState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required List<Task> tasks,
  }) {
    return TasksState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      tasks: tasks ?? this.tasks,
    );
  }
}
