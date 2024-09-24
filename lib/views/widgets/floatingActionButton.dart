import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class BuildFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed; // Use VoidCallback for better readability

  const BuildFloatingActionButton({
    super.key,
    required this.onPressed, // Add "this." to properly reference the parameter
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: onPressed,
      backgroundColor: ColorStyles.charcoalBrown,
      child: const Icon(Icons.add, color: ColorStyles.softBeige),
    );
  }
}
