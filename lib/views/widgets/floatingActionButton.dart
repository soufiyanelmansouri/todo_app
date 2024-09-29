import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task.dart';
import '../../controllers/task_controller.dart';
import '../../utils/constants.dart';

class BuildFloatingActionButton extends StatefulWidget {
  const BuildFloatingActionButton({super.key});

  @override
  State<BuildFloatingActionButton> createState() =>
      _BuildFloatingActionButtonState();
}

class _BuildFloatingActionButtonState extends State<BuildFloatingActionButton> {
  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        _showAddTaskBottomSheet(context);
      },
      backgroundColor: ColorStyles.charcoalBrown,
      child: const Icon(Icons.add, color: ColorStyles.softBeige),
    );
  }

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Allows the bottom sheet to be resized for keyboard
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom +
                20, // Ensures the bottom sheet resizes to fit keyboard
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Task Title'),
                controller: _titleController,
              ),
              TextField(
                decoration:
                    const InputDecoration(labelText: 'Task Description'),
                controller: _descriptionController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Provider.of<TaskController>(context, listen: false)
                      .addTask(Task(
                    id: DateTime.now().toString(),
                    title: _titleController.text,
                    description: _descriptionController.text,
                    isCompleted: false,
                  ));
                  Navigator.pop(context);
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        );
      },
    );
  }
}
