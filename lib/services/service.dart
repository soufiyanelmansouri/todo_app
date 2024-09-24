import '../models/task.dart';

class TaskService {
  // A list of mock tasks for testing
  List<Task> fetchTasks() {
    return [
      Task(
        id: '1',
        title: 'Buy groceries',
        description: 'Get milk, bread, and fruits from the store',
        isCompleted: false,
      ),
      Task(
        id: '2',
        title: 'Workout',
        description: 'Go for a 30-minute run and do strength training',
        isCompleted: false,
      ),
      Task(
        id: '3',
        title: 'Read a book',
        description: 'Finish reading Chapter 5 of Flutter development book',
        isCompleted: true,
      ),
      Task(
        id: '4',
        title: 'Clean the house',
        description: 'Vacuum the living room and organize the closet',
        isCompleted: false,
      ),
    ];
  }
}
