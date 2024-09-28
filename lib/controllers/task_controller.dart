import '../models/task.dart';
import '../services/task_service.dart';
import 'package:todo_app/controllers/state__controller.dart';

class TaskController extends StateController {
  final TaskService _taskService = TaskService();
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    try {
      setState(EnState.busy);
      _tasks = await _taskService.fetchTasks();
      setState(EnState.idel);
    } catch (e) {
      throw e.toString();
    }
  }

  void addTask(Task task) {
    setState(EnState.busy);
    _tasks.add(task);
    _taskService.addTask(task).catchError((e) {
      _tasks.remove(task);
      throw e.toString();
    });
    setState(EnState.idel);
  }

  void toggleTask(Task currentTask) async {
    currentTask.isCompleted = !currentTask.isCompleted;
    try {
      setState(EnState.busy);
      await _taskService.toggleTask(currentTask);
    } catch (e) {
      currentTask.isCompleted = !currentTask.isCompleted;
      //TODO: Show Snack Bar
    }
    setState(EnState.idel);
  }

  void deleteTask(int currentTaskIndex) {
    setState(EnState.busy);
    _taskService.deleteTask(currentTaskIndex, _tasks[currentTaskIndex].id!);
    _tasks.removeAt(
      currentTaskIndex,
    );
    setState(EnState.idel);
  }
}
