import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/views/screens/register_screen.dart';
import '../../controllers/auth_controller.dart';
import '../widgets/auth_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> _loginUser() async {
    final authController = Provider.of<AuthController>(context, listen: false);
    await authController.signIn(emailController.text, passwordController.text);

    if (!mounted) return;

    if (authController.authError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authController.authError!)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(
        emailController: emailController,
        passwordController: passwordController,
        buttonText: 'Sign In',
        onPressed: _loginUser,
        navText: "Don't have an account? ",
        navLinkText: "Sign Up",
        onNavLinkTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterScreen(),
            ),
          );
        },
      ),
    );
  }
}
