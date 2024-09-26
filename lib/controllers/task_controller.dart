import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/task_service.dart';

class TaskController extends ChangeNotifier {
  final TaskService _taskService = TaskService();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void fetchTasks() {
    _tasks = _taskService.fetchTasks();
    notifyListeners();
  }

  void addTask(newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggelTask(Task currentTask) {
    currentTask.isCompleted = !currentTask.isCompleted;
    notifyListeners();
  }

  void deleteTask(int currentTaskIndex) {
    _tasks.removeAt(currentTaskIndex);
    notifyListeners();
  }
}
