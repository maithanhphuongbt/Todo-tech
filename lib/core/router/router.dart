import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_tech/ui/constants/app_strings.dart';
import 'package:todo_tech/ui/views/all_tasks.dart';
import 'package:todo_tech/ui/views/complete_tasks.dart';
import 'package:todo_tech/ui/views/home.dart';
import 'package:todo_tech/ui/views/in_complete_task.dart';

class Router {
  static const String home = '/';
  static const String allTask = 'allTask';
  static const String completeTask = 'completeTask';
  static const String inCompleteTask = 'inCompleteTask';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (context) => route(settings),
        settings: RouteSettings(name: settings.name));
  }

  static route(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return Home();
      case allTask:
        return AllTasks();
      case completeTask:
        return CompleteTasks();
      case inCompleteTask:
        return InCompleteTasks();
      default:
        return Scaffold(
          body: Center(
            child: Text('$err_route_not_found ${settings.name}'),
          ),
        );
    }
  }
}
