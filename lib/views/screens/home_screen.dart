import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/views/widgets/buildBottomNavigationBar.dart';
import 'package:todo_app/views/widgets/floatingActionButton.dart';
import '../../controllers/task_controller.dart';
import '../../utils/constants.dart';
import '../widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.cream,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: Text(
            "Tasks",
            style: TextStyles.headerBold,
          ),
        ),
        Expanded(
          child: Consumer<TaskController>(
            builder: (context, taskController, child) {
              final tasks = taskController.tasks;
              return ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                    child: TeskItem(
                      task: task,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      floatingActionButton: BuildFloatingActionButton(
        onPressed: () {},
      ),
      bottomNavigationBar: const Buildbottomnavigationbar(),
    );
  }
}
