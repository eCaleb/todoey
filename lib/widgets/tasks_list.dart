import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

import 'tasks_tile.dart';

class TaskList extends StatefulWidget {
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.tasksCount,
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isCompleted,
            checkboxCallback: (checkboxState) {
              setState(() {
                // tasks[index].toggleBox();
                // widget.onTasksChanged?.call(tasks); // Notify parent on updates
              });
            },
          );
        },
      );
    });
  }
}
