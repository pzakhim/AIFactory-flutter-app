import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Design tokens for Typography using Inter font hierarchy.
abstract final class AppTypography {
  // Display
  static TextStyle get display => GoogleFonts.inter(
        fontSize: 48,
        height: 58 / 48,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  // Headings
  static TextStyle get h1 => GoogleFonts.inter(
        fontSize: 40,
        height: 48 / 40,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get h2 => GoogleFonts.inter(
        fontSize: 32,
        height: 40 / 32,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get h3 => GoogleFonts.inter(
        fontSize: 24,
        height: 32 / 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get h4 => GoogleFonts.inter(
        fontSize: 20,
        height: 28 / 20,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  // Large
  static TextStyle get largeRegular => GoogleFonts.inter(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      );

  static TextStyle get largeSemiBold => GoogleFonts.inter(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  // Medium
  static TextStyle get mediumRegular => GoogleFonts.inter(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  static TextStyle get mediumSemiBold => GoogleFonts.inter(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  // Small
  static TextStyle get smallRegular => GoogleFonts.inter(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  static TextStyle get smallSemiBold => GoogleFonts.inter(
        fontSize: 12,
        height: 16 / 12,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  // Tiny
  static TextStyle get tinyRegular => GoogleFonts.inter(
        fontSize: 10,
        height: 12 / 10,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      );

  static TextStyle get tinySemiBold => GoogleFonts.inter(
        fontSize: 10,
        height: 12 / 10,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );
}
