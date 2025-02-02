import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

import 'tasks_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemCount: taskData.tasksCount,
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isCompleted,
            checkboxCallback: (checkboxState) {
              taskData.updateTask(task);
            },
            longPressCallBack: () {
              taskData.deleteTask(task);
            },
          );
        },
      );
    });
  }
}
