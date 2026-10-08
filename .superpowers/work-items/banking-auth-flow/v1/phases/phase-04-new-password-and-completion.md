# Phase 04 — New Password Setup & Completion Flow: UIT-05 & UIT-06

- **Status:** PASSED
- **AC IDs:** AC-05, AC-06
- **Depends on:** Phase 03 (Recovery & OTP)
- **Input/output contract:**
  - Input: Completed Phase 01-03 foundation, OTP verification, and navigation state.
  - Output: Fully interactive `NewPasswordPage` (UIT-05) pixel-aligned with `screen_5_dat_mat_khau_moi.jpg` and `ResetPasswordSuccessPage` (UIT-06) pixel-aligned with `screen_6_doi_mat_khau_thanh_cong.jpg`, completing the end-to-end flow.
- **Owned files:**
  - `lib/modules/auth/presentation/cubits/new_password_cubit.dart`
  - `lib/modules/auth/presentation/cubits/new_password_state.dart`
  - `lib/modules/auth/presentation/pages/new_password_page.dart`
  - `lib/modules/auth/presentation/widgets/password_criteria_card.dart`
  - `lib/modules/auth/presentation/pages/reset_password_success_page.dart`
  - `lib/modules/auth/presentation/widgets/security_detail_card.dart`
  - `test/modules/auth/presentation/pages/new_password_page_test.dart`
  - `test/modules/auth/presentation/pages/reset_password_success_page_test.dart`
  - `test/integration/banking_auth_flow_test.dart`
- **Owner:** Code Writer
- **Ready when:** Phase 03 passes its pass gate.

## Tasks

1. Implement `NewPasswordCubit` and `NewPasswordState`:
   - Live checks for 4 password rules:
     - Rule 1: Length between 8 and 20 characters.
     - Rule 2: Contains both uppercase and lowercase letters (A-Z, a-z).
     - Rule 3: Contains at least one number (0-9).
     - Rule 4: Contains at least one special character (`!@#$%^&*`).
   - Confirmation match check.
   - Computes `isAllValid` to enable/disable "Cập nhật mật khẩu" button.
2. Implement `PasswordCriteriaCard`:
   - Card container with title "Tiêu chuẩn mật khẩu ngân hàng".
   - 4 criteria rows dynamically switching between green checkmark (`icon-success`) and grey outline circle.
3. Implement `NewPasswordPage` (UIT-05) matching `screen_5_dat_mat_khau_moi.jpg`:
   - Top App Bar with back button, title "Đặt mật khẩu mới", right help icon.
   - Badge "BƯỚC 3 / 3 • BẢO MẬT".
   - Heading "Thiết lập mật khẩu an toàn" + subtitle.
   - New password field with lock icon and visibility toggle.
   - `PasswordCriteriaCard`.
   - Confirm password field with visibility toggle and mismatch error.
   - Primary button "Cập nhật mật khẩu" (disabled until valid).
   - PCI compliance security footer note.
4. Implement `SecurityDetailCard`:
   - Information card displaying update timestamp (e.g. `14:32 - 24/10/2026`), verification method `Mã OTP SMS`, and previous sessions note.
5. Implement `ResetPasswordSuccessPage` (UIT-06) matching `screen_6_doi_mat_khau_thanh_cong.jpg`:
   - Large circular green checkmark badge (80x80px).
   - Heading "Đổi mật khẩu thành công" + explanatory message.
   - `SecurityDetailCard`.
   - Security advisory callout banner.
   - Primary button "Quay lại đăng nhập" which calls `pushNamedAndRemoveUntil(login)` to reset the navigation stack.
   - Hotline footer "Không phải bạn thực hiện? Gọi Hotline 1900 6868".
6. End-to-end integration and routing across all 6 screens (`UIT-01` through `UIT-06`).
7. Write widget and integration tests covering the complete flow.

## Pass gate

- `flutter analyze` runs with 0 errors and 0 warnings: **PASSED** (0 issues found).
- `flutter test` runs with 100% pass rate across all tests: **PASSED** (28/28 tests passed).
