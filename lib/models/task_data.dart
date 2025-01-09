import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> tasks = [
    Task(name: 'buy milk'),
    Task(name: 'buy eggs'),
    Task(name: 'go to the market'),
  ];

  int get tasksCount {
    return tasks.length;
  }

  void addTask(String newTask) {
    final task = Task(name: newTask);
    tasks.add(task);
    notifyListeners();
  }
}
