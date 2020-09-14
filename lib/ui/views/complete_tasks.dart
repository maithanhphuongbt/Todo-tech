import 'package:flutter/material.dart';
import 'package:todo_tech/ui/constants/app_strings.dart';
import 'package:todo_tech/ui/widgets/todo_widget.dart';

class CompleteTasks extends StatefulWidget {
  @override
  _CompleteTasksState createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title_complete_task),
        ),
        body: TodoWidget(taskType: TaskType.COMPLETE));
  }
}
