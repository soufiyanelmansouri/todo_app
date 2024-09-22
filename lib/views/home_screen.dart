import 'package:flutter/material.dart';

import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.lightBrown,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            child: Text(
              "Tasks",
              style: TextStyles.boldStyle,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        backgroundColor: ColorStyles.darkBrown,
        child: const Icon(Icons.add, color: ColorStyles.lightBrown),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorStyles.brown,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.list,
                  color: ColorStyles.lightBrown,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: ColorStyles.lightBrown,
                )),
          ],
        ),
      ),
    );
  }
}
