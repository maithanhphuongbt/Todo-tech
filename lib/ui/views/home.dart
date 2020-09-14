import 'package:flutter/material.dart';
import 'package:todo_tech/core/redux/store.dart';
import 'package:todo_tech/core/redux/tasks/tasks_actions.dart';
import 'package:todo_tech/ui/views/all_tasks.dart';
import 'package:todo_tech/ui/views/in_complete_task.dart';
import 'complete_tasks.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);

    Redux.store.dispatch(fetchTasksAction());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavBar(),
      ),
    );
  }

  _buildBody() => Container(
        child: TabBarView(
          controller: _tabController,
          children: [AllTasks(), CompleteTasks(), InCompleteTasks()],
        ),
      );

  _buildBottomNavBar() => TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.done_outline),
          ),
          Tab(
            icon: Icon(Icons.cancel),
          )
        ],
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.transparent,
      );
}
