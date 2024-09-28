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
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Task.fromJson(data);
      }).toList();
      return tasks;
    } catch (e) {
      throw Exception("Error fetching tasks: $e");
    }
  }

  // Add Task to Firestore
  Future<void> addTask(Task task) async {
    try {
      await _firestore.collection(tasksCollection).add(task.toJson());
    } catch (e) {
      throw Exception("Error adding task: $e");
    }
  }

  void deleteTask(int currentTaskIndex, String taskId) async {
    try {
      await _firestore.collection('tasks').doc(taskId).delete();
    } catch (e) {
      print('Failed to delete task: $e');
    }
  }
}
