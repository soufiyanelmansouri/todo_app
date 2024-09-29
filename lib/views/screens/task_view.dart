import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';

class TaskView extends StatelessWidget {
  final Task task;

  const TaskView({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(task.description),
            // Add more UI elements to display task details
          ],
        ),
      ),
    );
  }
}
