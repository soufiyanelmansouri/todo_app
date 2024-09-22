import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle boldStyle = const TextStyle(
    color: ColorStyles.darkBrown,
    fontWeight: FontWeight.w700,
    fontSize: 35,
  );
  static const TextStyle semiBold = TextStyle(
    color: ColorStyles.darkBrown,
    fontWeight: FontWeight.w400, // Semi-bold
  );

  static const TextStyle normal = TextStyle(
    color: ColorStyles.darkBrown,
    fontWeight: FontWeight.normal,
  );
}

class ColorStyles {
  static const Color lightBrown = Color.fromARGB(255, 250, 247, 240);
  static const Color geryBrown = Color.fromARGB(255, 216, 210, 194);
  static const Color brown = Color.fromARGB(255, 177, 116, 87);
  static const Color darkBrown = Color.fromARGB(255, 74, 73, 71);
}
