import 'package:flutter/material.dart';
import 'package:todo_tech/core/models/task.dart';
import 'package:todo_tech/core/redux/store.dart';
import 'package:todo_tech/core/redux/tasks/tasks_actions.dart';
import 'package:todo_tech/ui/constants/text_styles.dart';

class TodoItemWidget extends StatefulWidget {
  final Task task;

  const TodoItemWidget(this.task);

  @override
  _TodoItemWidgetState createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  bool _isCompleteTask;

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _isCompleteTask = widget.task.status;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: CheckboxListTile(
          value: _isCompleteTask,
          onChanged: (value) {
            setState(() {
              _isCompleteTask = value;
            });
            Redux.store.dispatch(updateStatusTasksAction(widget.task.id));
          },
          title: Text(widget.task.title ?? '',
              style: titleTextStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          subtitle: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(widget.task.description ?? '',
                  style: subTitleTextStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis)),
          key: Key(widget.task.id.toString()),
        ),
      ),
    );
  }
}
