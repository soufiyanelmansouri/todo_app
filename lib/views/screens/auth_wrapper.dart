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
    // Use Provider to access AuthController
    final authController = Provider.of<AuthController>(context);

    // Get the current user from the AuthController
    final UserModel? user = authController.currentUser;

    // If the user is logged in, navigate to HomeScreen; otherwise, navigate to LoginScreen
    if (user != null) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}
