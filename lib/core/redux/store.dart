import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:todo_tech/core/redux/tasks/tasks_reducer.dart';
import 'package:todo_tech/core/redux/tasks/tasks_state.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    tasksState: taskReducer(state.tasksState, action),
  );
}

@immutable
class AppState {
  final TasksState tasksState;

  AppState({
    @required this.tasksState,
  });

  AppState copyWith({
    TasksState tasksState,
  }) {
    return AppState(
      tasksState: tasksState ?? this.tasksState,
    );
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("Store is not initialized");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {
    final tasksStateInitial = TasksState.initial();

    _store = Store<AppState>(
      appReducer,
      initialState: AppState(tasksState: tasksStateInitial),
    );
  }
}
