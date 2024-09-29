import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/state__controller.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/models/task.dart';

import '../../utils/constants.dart';
import '../screens/task_view.dart';

class TeskItem extends StatelessWidget {
  final Task task;
  final int index;

  const TeskItem({super.key, required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          color: ColorStyles.charcoalBrown,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            // Navigate to TaskView screen and pass the task as an argument
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskView(
                  task: task,
                ), // Assuming TaskView accepts a Task parameter
              ),
            );
          },
          child: ListTile(
            leading: Consumer<TaskController>(
              builder: (context, taskController, child) {
                return taskController.state == EnState.busy
                    ? const CircularProgressIndicator(
                        color: ColorStyles.cream,
                      )
                    : Checkbox(
                        side: const BorderSide(color: ColorStyles.cream),
                        value: task.isCompleted,
                        onChanged: (value) {
                          taskController.toggleTask(task);
                        },
                      );
              },
            ),
            title: Text(
              task.title,
              style: TextStyles.bodyMedium,
            ),
            subtitle: Text(
              task.description.isEmpty
                  ? 'No description provided'
                  : task.description,
              style: TextStyles.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: ColorStyles.softBeige),
              onPressed: () {
                Provider.of<TaskController>(context, listen: false)
                    .deleteTask(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
