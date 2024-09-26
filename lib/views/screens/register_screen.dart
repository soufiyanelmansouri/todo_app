import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth_controller.dart';
import '../../utils/constants.dart';
// Assuming you have TextStyles and ColorStyles in constants.dart

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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Sign Up',
                style: TextStyles.headerBold,
              ),
            ),
            const SizedBox(height: 60),
            const Center(
              child: Text(
                'Create an account',
                style: TextStyles.subheaderSemiBold,
              ),
            ),
            const SizedBox(height: 60),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: ColorStyles.softBeige,
                labelText: 'Email',
                labelStyle: TextStyles.bodyRegular,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorStyles.charcoalBrown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorStyles.warmTerracotta),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: ColorStyles.softBeige,
                labelText: 'Password',
                labelStyle: TextStyles.bodyRegular,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorStyles.charcoalBrown),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorStyles.warmTerracotta),
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _registerUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorStyles.warmTerracotta,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  'Register',
                  style: TextStyles.buttonBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
