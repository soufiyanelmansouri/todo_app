import 'package:flutter/material.dart';

import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.cream,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            child: Text(
              "Tasks",
              style: TextStyles.headerBold,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: const BoxDecoration(
                        color: ColorStyles.warmTerracotta,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          child: Text(
                            "Go To Gym",
                            style: TextStyles.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Plan and organize tasks, and manage deadlines efficiently with a simple to-do app.",
                            style: TextStyles.bodyMedium,
                            maxLines:
                                1, // Adjust to the number of lines you want
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        backgroundColor: ColorStyles.charcoalBrown,
        child: const Icon(Icons.add, color: ColorStyles.softBeige),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorStyles.warmTerracotta,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.list,
                  color: ColorStyles.softBeige,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: ColorStyles.softBeige,
                )),
          ],
        ),
      ),
    );
  }
}
