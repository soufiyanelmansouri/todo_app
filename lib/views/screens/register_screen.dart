import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/views/screens/home_screen.dart';
import 'package:todo_app/views/screens/login_screen.dart';
import '../../controllers/auth_controller.dart';
import '../widgets/auth_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _registerUser() async {
    final authController = Provider.of<AuthController>(context, listen: false);
    await authController.signUp(
        _emailController.text, _passwordController.text);

    if (!mounted) return;

    if (authController.authError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authController.authError!)),
      );
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthForm(
        emailController: _emailController,
        passwordController: _passwordController,
        buttonText: 'Sing Up',
        onPressed: _registerUser,
        navText: "Have an account? ",
        navLinkText: "Login",
        onNavLinkTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
      ),
    );
  }
}
