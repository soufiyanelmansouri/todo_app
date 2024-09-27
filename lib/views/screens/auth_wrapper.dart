import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/views/screens/home_screen.dart';
import 'package:todo_app/views/screens/login_screen.dart';
import '../../controllers/auth_controller.dart';
import '../../models/user_model.dart';
// Your custom User model

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    final UserModel? user = authController.currentUser;

    if (user != null) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}
