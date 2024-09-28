import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controllers/task_controller.dart';
import 'package:todo_app/models/task.dart';

import '../../utils/constants.dart';

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
        child: ListTile(
          leading: Checkbox(
            value: task.isCompleted,
            onChanged: (_) {
              Provider.of<TaskController>(context, listen: false)
                  .toggelTask(task);
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
            style: TextStyles.bodyRegular,
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
    );
  }
}
