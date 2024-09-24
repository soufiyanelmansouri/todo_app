import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/service.dart';

class TaskController extends ChangeNotifier {
  final TaskService _taskService = TaskService();
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void fetchTasks() {
    _tasks = _taskService.fetchTasks();
    notifyListeners();
  }
}
