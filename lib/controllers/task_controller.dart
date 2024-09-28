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
      notifyListeners();
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

  void toggleTask(Task currentTask) async {
    currentTask.isCompleted = !currentTask.isCompleted;
    try {
      await _taskService.toggleTask(currentTask);
      //TODO: i still have an error on this function i chech tomorow
    } catch (e) {
      currentTask.isCompleted = !currentTask.isCompleted;
      //TODO: Show Snack Bar
    }
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
