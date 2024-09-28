import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/task_service.dart';

class TaskController extends ChangeNotifier {
  final TaskService _taskService = TaskService();
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    try {
      _tasks = await _taskService.fetchTasks();
      notifyListeners(); // Update UI
    } catch (e) {
      throw e.toString();
    }
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
    _taskService.addTask(task).catchError((e) {
      _tasks.remove(task);
      notifyListeners();
      throw e.toString();
    });
  }

  void toggelTask(Task currentTask) {
    currentTask.isCompleted = !currentTask.isCompleted;
    notifyListeners();
  }

  void deleteTask(int currentTaskIndex) {
    _taskService.deleteTask(currentTaskIndex, _tasks[currentTaskIndex].id);
    _tasks.removeAt(
      currentTaskIndex,
    );
    notifyListeners();
  }
}
