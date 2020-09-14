import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:todo_tech/core/models/task.dart';
import 'package:todo_tech/core/redux/store.dart';
import 'package:todo_tech/ui/constants/app_strings.dart';
import 'package:todo_tech/ui/constants/app_value.dart';
import 'package:todo_tech/ui/widgets/loading.dart';
import 'package:todo_tech/ui/widgets/todo_item_widget.dart';

enum TaskType { ALL, COMPLETE, IN_COMPLETE }

class TodoWidget extends StatefulWidget {
  final TaskType taskType;

  const TodoWidget({Key key, this.taskType}) : super(key: key);

  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: StoreConnector<AppState, bool>(
              distinct: true,
              converter: (store) => store.state.tasksState.isLoading,
              builder: (context, isLoading) {
                if (isLoading != null && isLoading) return LoadingWidget();
                return SizedBox.shrink();
              },
            ),
          ),
          Container(
            child: StoreConnector<AppState, bool>(
              distinct: true,
              converter: (store) => store.state.tasksState.isError,
              builder: (context, isError) {
                if (isError != null && isError)
                  return Center(child: Text(err_get_task_fail));
                return SizedBox.shrink();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(horizontal_margin),
            child: StoreConnector<AppState, List<Task>>(
              distinct: true,
              converter: (store) => store.state.tasksState.tasks,
              builder: (context, tasks) {
                if (tasks != null)
                  return ListView(
                    children: _buildTasks(tasks),
                  );
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTasks(List<Task> tasks) {
    List<Widget> taskList = [];
    tasks.map(
      (task) {
        switch (widget.taskType) {
          case TaskType.COMPLETE:
            if (task.status) taskList.add(TodoItemWidget(task));
            break;
          case TaskType.IN_COMPLETE:
            if (!task.status) taskList.add(TodoItemWidget(task));
            break;
          default:
            taskList.add(TodoItemWidget(task));
        }
      },
    ).toList();
    return taskList;
  }
}
