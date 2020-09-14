import 'package:meta/meta.dart';
import 'package:todo_tech/core/models/task.dart';
import 'package:todo_tech/core/redux/tasks/tasks_state.dart';
import 'package:todo_tech/core/services/api_services.dart';
import 'package:todo_tech/core/services/api_urls.dart';

import '../store.dart';

@immutable
class GetTasksAction {
  final TasksState tasksState;

  GetTasksAction(this.tasksState);
}

@immutable
class UpdateTaskAction {
  final int idTask;
  final TasksState tasksState;
  UpdateTaskAction(this.idTask, this.tasksState);
}

Future<void> fetchTasksAction() async {
  Redux.store.dispatch(GetTasksAction(TasksState(isLoading: true)));

  try {
    var todoList = await ApiServices().get(get_todo_list_url);
    Redux.store.dispatch(
      GetTasksAction(
        TasksState(
          isLoading: false,
          tasks: Task.listFromJson(todoList),
        ),
      ),
    );
  } catch (error) {
    Redux.store.dispatch(GetTasksAction(TasksState(isError: true)));
  }
}

updateStatusTasksAction(int idTask) {
  try {
    Redux.store.dispatch(
      UpdateTaskAction(
        idTask,
        Redux.store.state.tasksState,
      ),
    );
  } catch (error) {
    Redux.store.dispatch(GetTasksAction(TasksState(isError: true)));
  }
}
