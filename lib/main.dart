import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_options.dart';
import 'controllers/auth_controller.dart';
import 'controllers/task_controller.dart';
import 'views/screens/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(
            create: (_) => AuthController() // Initialize AuthController
            ),
        ChangeNotifierProvider<TaskController>(
            create: (_) =>
                TaskController()..fetchTasks() // Initialize AuthController
            ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthWrapper(),
      ),
    );
  }
}
