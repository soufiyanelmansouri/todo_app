import 'package:flutter/material.dart';

class TextStyles {
  // Large bold text for headers
  static const TextStyle headerBold = TextStyle(
    color: ColorStyles.charcoalBrown,
    fontWeight: FontWeight.w700,
    fontSize: 35,
  );

  // Semi-bold text for subheaders
  static const TextStyle subheaderSemiBold = TextStyle(
    color: ColorStyles.charcoalBrown,
    fontWeight: FontWeight.w600, // Semi-bold
    fontSize: 28,
  );

  // Medium weight text for body
  static const TextStyle bodyMedium = TextStyle(
    color: ColorStyles.softBeige,
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 18,
  );

  // Regular text for body content
  static const TextStyle bodyRegular = TextStyle(
    color: ColorStyles.charcoalBrown,
    fontWeight: FontWeight.w400, // Normal weight
    fontSize: 16,
  );

  // Italic style for emphasis
  static const TextStyle italicText = TextStyle(
    color: ColorStyles.charcoalBrown,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,
    fontSize: 18,
  );

  // Light weight text for captions
  static const TextStyle captionLight = TextStyle(
    color: ColorStyles.softBeige,
    fontWeight: FontWeight.w300, // Light weight
    fontSize: 14,
  );

  // Bold uppercase text for buttons
  static const TextStyle buttonBold = TextStyle(
    color: ColorStyles.softBeige,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    letterSpacing: 1.5, // Slight letter spacing for buttons
  );

  // Small italic caption text
  static const TextStyle smallItalicCaption = TextStyle(
    color: ColorStyles.softBeige,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w300,
    fontSize: 12,
  );
}

class ColorStyles {
  static const Color cream =
      Color(0xFFFAF7F0); // #FAF7F0 - Light, warm cream color
  static const Color softBeige =
      Color(0xFFD8D2C2); // #D8D2C2 - Soft beige with greyish tint
  static const Color warmTerracotta =
      Color(0xFFB17457); // #B17457 - Warm brownish-orange terracotta
  static const Color charcoalBrown =
      Color(0xFF4A4947); // #4A4947 - Dark, muted brown with greyish tone
}
