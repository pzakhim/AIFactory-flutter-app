import 'package:flutter/material.dart';

/// Design tokens for Colors based on Banking Design System.
abstract final class AppColors {
  // Primitives - Primary (Indigo/Blue Accent)
  static const Color primary50 = Color(0xFFEDEFFE);
  static const Color primary100 = Color(0xFFC8CEFC);
  static const Color primary200 = Color(0xFFAEB6FB);
  static const Color primary300 = Color(0xFF8895F9);
  static const Color primary400 = Color(0xFF7181F8);
  static const Color primary500 = Color(0xFF4E61F6); // Brand Primary
  static const Color primary600 = Color(0xFF4758E0);
  static const Color primary700 = Color(0xFF3745AF);
  static const Color primary800 = Color(0xFF2B3587);
  static const Color primary900 = Color(0xFF212967);

  // Primitives - Grey (Neutrals & Layout)
  static const Color grey50 = Color(0xFFF9FAFB);
  static const Color grey100 = Color(0xFFF3F4F6);
  static const Color grey200 = Color(0xFFE5E7EA);
  static const Color grey300 = Color(0xFFD2D5DB);
  static const Color grey400 = Color(0xFF9EA2AE);
  static const Color grey500 = Color(0xFF6D717F);
  static const Color grey600 = Color(0xFF4D5461);
  static const Color grey700 = Color(0xFF394050);
  static const Color grey800 = Color(0xFF212936);
  static const Color grey900 = Color(0xFF131927);

  // Primitives - Green (Success)
  static const Color green50 = Color(0xFFECF8EF);
  static const Color green100 = Color(0xFFC5E9CD);
  static const Color green500 = Color(0xFF43B75D);
  static const Color green600 = Color(0xFF3DA755);
  static const Color green900 = Color(0xFF1C4D27);

  // Primitives - Red (Error / Danger)
  static const Color red50 = Color(0xFFFDECEC);
  static const Color red100 = Color(0xFFFAC5C3);
  static const Color red500 = Color(0xFFEE443F);
  static const Color red600 = Color(0xFFD93E39);
  static const Color red900 = Color(0xFF641D1A);

  // Primitives - Yellow (Warning / Attention)
  static const Color yellow50 = Color(0xFFFFF7E6);
  static const Color yellow100 = Color(0xFFFFE5B0);
  static const Color yellow500 = Color(0xFFFFAA00);
  static const Color yellow600 = Color(0xFFE89B00);
  static const Color yellow900 = Color(0xFF6B4700);

  // Primitives - Blue (Info)
  static const Color blue50 = Color(0xFFE6F4FF);
  static const Color blue100 = Color(0xFFB0DEFF);
  static const Color blue500 = Color(0xFF0095FF);
  static const Color blue600 = Color(0xFF0088E8);
  static const Color blue900 = Color(0xFF003F6B);

  // Semantic Surfaces
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color surfaceGrey = grey50;
  static const Color surfaceAccent = primary50;
  static const Color surfaceBlack = grey900;

  // Semantic Text & Icons
  static const Color textPrimary = grey900;
  static const Color textSecondary = grey500;
  static const Color textDisabled = grey400;
  static const Color textLinks = primary500;
  static const Color textAccent = primary500;
  static const Color textLightGrey = grey300;
  static const Color textWhite = Color(0xFFFFFFFF);

  // Semantic Status
  static const Color success = green500;
  static const Color successBg = green50;
  static const Color error = red500;
  static const Color errorBg = red50;
  static const Color warning = yellow500;
  static const Color warningBg = yellow50;
  static const Color info = blue500;
  static const Color infoBg = blue50;

  // Icons
  static const Color iconBlack = grey900;
  static const Color iconWhite = Color(0xFFFFFFFF);
  static const Color iconAccent = primary500;
  static const Color iconGrey = grey400;
  static const Color iconLightGrey = grey300;
  static const Color iconSuccess = green500;
  static const Color iconError = red500;
  static const Color iconWarning = yellow500;
  static const Color iconInfo = blue500;
}
