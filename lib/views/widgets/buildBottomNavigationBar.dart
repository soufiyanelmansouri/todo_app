import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class Buildbottomnavigationbar extends StatelessWidget {
  const Buildbottomnavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: ColorStyles.warmTerracotta,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              // TODO
            },
            icon: const Icon(Icons.list, color: ColorStyles.softBeige),
          ),
          IconButton(
            onPressed: () {
              // TODO
            },
            icon: const Icon(Icons.person, color: ColorStyles.softBeige),
          ),
        ],
      ),
    );
  }
}
