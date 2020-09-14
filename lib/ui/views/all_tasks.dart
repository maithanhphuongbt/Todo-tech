import 'package:flutter/material.dart';
import 'package:todo_tech/ui/constants/app_strings.dart';
import 'package:todo_tech/ui/widgets/todo_widget.dart';

class AllTasks extends StatefulWidget {
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title_all_task),
      ),
      body: TodoWidget(taskType: TaskType.ALL),
    );
  }
}
