import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task.dart'; // Assuming you have a Task model class.

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection name in Firestore
  final String tasksCollection = "tasks";

  // Fetch Tasks from Firestore
  Future<List<Task>> fetchTasks() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection(tasksCollection).get();

      List<Task> tasks = querySnapshot.docs.map((doc) {
        return Task.fromFirestore(doc);
      }).toList();

      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  // Add Task to Firestore
  Future<void> addTask(Task task) async {
    try {
      DocumentReference docRef =
          await _firestore.collection(tasksCollection).add(task.toJson());
      task.id = docRef.id;
    } catch (e) {
      rethrow;
    }
  }

  void deleteTask(int currentTaskIndex, String taskId) async {
    try {
      await _firestore.collection(tasksCollection).doc(taskId).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> toggleTask(Task currentTask) async {
    try {
      await FirebaseFirestore.instance
          .collection(tasksCollection)
          .doc(currentTask.id)
          .update({
        'isCompleted': currentTask.isCompleted,
      });
    } catch (e) {
      rethrow;
    }
  }
}
