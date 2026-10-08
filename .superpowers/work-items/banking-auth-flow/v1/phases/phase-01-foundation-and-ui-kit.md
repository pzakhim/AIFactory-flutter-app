# Phase 01 — Project Foundation & Commons UI Kit

- **Status:** PASSED
- **AC IDs:** AC-07, AC-08
- **Depends on:** NONE
- **Input/output contract:**
  - Input: Empty workspace, `Design_System.md` specifications, and Coder Nexus architecture guidelines.
  - Output: Compiling Flutter application scaffold at `.`, design tokens (`AppColors`, `AppTypography`, `AppSpacing`, `AppRadius`, `AppShadows`), theme data, and verified commons UI Kit widgets (`AppPrimaryButton`, `AppSecondaryButton`, `AppTextField`, `AppCheckbox`, `BalanceGradientCard`, `SecurityBadge`, `NoticeBannerBox`).
- **Owned files:**
  - `pubspec.yaml`
  - `lib/main.dart`
  - `lib/app.dart`
  - `lib/core/theme/app_colors.dart`
  - `lib/core/theme/app_typography.dart`
  - `lib/core/theme/app_spacing.dart`
  - `lib/core/theme/app_radius.dart`
  - `lib/core/theme/app_theme.dart`
  - `lib/core/bloc/base_bloc_state.dart`
  - `lib/commons/button/app_primary_button.dart`
  - `lib/commons/button/app_secondary_button.dart`
  - `lib/commons/input/app_text_field.dart`
  - `lib/commons/selection/app_checkbox.dart`
  - `lib/commons/card/balance_gradient_card.dart`
  - `lib/commons/badge/security_badge.dart`
  - `lib/commons/feedback/notice_banner_box.dart`
  - `test/core/theme/tokens_test.dart`
  - `test/commons/ui_kit_test.dart`
- **Owner:** Code Writer
- **Ready when:** Gate 3 approval received for `implement-plan.md` and phase revisions.

## Tasks

1. Initialize Flutter project in workspace root (`.`) using `flutter create --org com.digibank --project-name digibank_app .` (preserving existing docs/config files).
2. Configure `pubspec.yaml` dependencies: `flutter_bloc: ^8.1.6`, `equatable: ^2.0.5`, Google Fonts (`google_fonts: ^6.2.1` for Inter), Cupertino icons.
3. Implement core design token classes in `lib/core/theme/` matching `Design_System.md`:
   - `AppColors` (all primitives and semantic colors).
   - `AppTypography` (`Inter` hierarchy from Display 48px to Tiny 10px).
   - `AppSpacing` (0px to 24px) & `AppRadius` (4px to 24px, pill).
   - `AppTheme` integrating colors and text styles.
4. Implement base BLoC state `BaseBlocState` in `lib/core/bloc/base_bloc_state.dart`.
5. Implement standardized commons UI kit in `lib/commons/`:
   - `AppPrimaryButton` with loading indicator and disabled state.
   - `AppSecondaryButton` with outline border and touch-target padding.
   - `AppTextField` with floating/outline border, prefix/suffix icons, visibility toggle, and inline error.
   - `AppCheckbox` with accessibility semantics and tap padding.
   - `BalanceGradientCard` with mask toggle and copy account number support.
   - `SecurityBadge` with verified, encrypted, and warning status variants.
   - `NoticeBannerBox` with alert icon, left strip, and custom action.
6. Write unit and widget tests in `test/core/theme/tokens_test.dart` and `test/commons/ui_kit_test.dart`.

## Pass gate

- `flutter analyze` runs with 0 errors and 0 warnings.
- `flutter test test/core/theme/ test/commons/` passes 100%.
