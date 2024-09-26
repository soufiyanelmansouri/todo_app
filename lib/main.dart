import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/task_controller.dart';
import 'views/screens/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskController()..fetchTasks(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegisterScreen(),
      ),
    );
  }
}
