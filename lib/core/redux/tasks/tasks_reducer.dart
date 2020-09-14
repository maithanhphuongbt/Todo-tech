import 'package:todo_tech/core/models/task.dart';
import 'package:todo_tech/core/redux/tasks/tasks_actions.dart';
import 'package:todo_tech/core/redux/tasks/tasks_state.dart';
import 'package:redux/redux.dart';

final taskReducer = combineReducers<TasksState>([
  TypedReducer<TasksState, UpdateTaskAction>(_updateTask),
  TypedReducer<TasksState, GetTasksAction>(_getTask),
]);

TasksState _updateTask(TasksState tasksState, UpdateTaskAction action) {
  return TasksState(
      tasks: tasksState.tasks
          .map((task) => task.id == action.idTask
              ? Task(
                  id: task.id,
                  title: task.title,
                  description: task.description,
                  status: !task.status)
              : task)
          .toList());
}

TasksState _getTask(TasksState tasksState, GetTasksAction action) {
  return action.tasksState;
}
