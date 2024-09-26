import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class AuthForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String buttonText;
  final VoidCallback onPressed;
  final String navText;
  final String navLinkText;
  final VoidCallback? onNavLinkTap; // Optional callback for navigation

  const AuthForm({
    required this.emailController,
    required this.passwordController,
    required this.buttonText,
    required this.onPressed,
    required this.navText,
    required this.navLinkText,
    this.onNavLinkTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              buttonText,
              style: TextStyles.headerBold,
            ),
          ),
          const SizedBox(height: 60),
          TextField(
            controller: emailController,
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
            controller: passwordController,
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
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorStyles.warmTerracotta,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                buttonText,
                style: TextStyles.buttonBold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Navigation Prompt
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                navText,
                style: TextStyles.bodyRegular,
              ),
              GestureDetector(
                onTap: onNavLinkTap,
                child: Text(
                  navLinkText,
                  style: const TextStyle(
                    color: ColorStyles.warmTerracotta,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
