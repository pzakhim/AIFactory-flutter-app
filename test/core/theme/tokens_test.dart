import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:digibank_app/core/theme/app_colors.dart';
import 'package:digibank_app/core/theme/app_radius.dart';
import 'package:digibank_app/core/theme/app_spacing.dart';
import 'package:digibank_app/core/theme/app_theme.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Design Tokens Verification', () {
    test('AppColors verifies primary and semantic tokens', () {
      expect(AppColors.primary500, equals(const Color(0xFF4E61F6)));
      expect(AppColors.surfaceWhite, equals(const Color(0xFFFFFFFF)));
      expect(AppColors.surfaceGrey, equals(const Color(0xFFF9FAFB)));
      expect(AppColors.textPrimary, equals(const Color(0xFF131927)));
      expect(AppColors.success, equals(const Color(0xFF43B75D)));
      expect(AppColors.error, equals(const Color(0xFFEE443F)));
      expect(AppColors.warning, equals(const Color(0xFFFFAA00)));
    });

    test('AppSpacing verifies 4px base scale', () {
      expect(AppSpacing.none, equals(0.0));
      expect(AppSpacing.xxs, equals(4.0));
      expect(AppSpacing.xs, equals(8.0));
      expect(AppSpacing.sm, equals(12.0));
      expect(AppSpacing.md, equals(16.0));
      expect(AppSpacing.lg, equals(20.0));
      expect(AppSpacing.xl, equals(24.0));
    });

    test('AppRadius verifies corner radius scale', () {
      expect(AppRadius.xs, equals(8.0));
      expect(AppRadius.sm, equals(12.0));
      expect(AppRadius.md, equals(16.0));
      expect(AppRadius.buttonRadius, equals(BorderRadius.circular(12.0)));
    });

    test('AppTheme creates valid ThemeData with light mode', () {
      final theme = AppTheme.lightTheme;
      expect(theme.scaffoldBackgroundColor, equals(AppColors.surfaceGrey));
      expect(theme.primaryColor, equals(AppColors.primary500));
    });
  });
}
