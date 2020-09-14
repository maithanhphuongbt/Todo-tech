import 'package:flutter/material.dart';
import 'package:todo_tech/ui/constants/app_strings.dart';
import 'package:todo_tech/ui/widgets/todo_widget.dart';

class InCompleteTasks extends StatefulWidget {
  @override
  _InCompleteTasksState createState() => _InCompleteTasksState();
}

class _InCompleteTasksState extends State<InCompleteTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title_in_complete_task),
        ),
        body: TodoWidget(taskType: TaskType.IN_COMPLETE));
  }
}
