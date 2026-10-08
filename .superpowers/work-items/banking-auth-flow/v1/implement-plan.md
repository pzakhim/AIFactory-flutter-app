# Implementation plan — Banking Authentication & Password Recovery Flow v1

- **Brief:** [brief.md](brief.md)
- **Design:** [design.md](design.md)
- **Accepted document revisions:**
  - Brief v1: Gate 1 approved by user in interaction step ("Đồng ý phê duyệt Gate 1: Requirements Brief")
  - Design v1: Gate 2 approved by user in interaction step ("Đồng ý phê duyệt Gate 2: Design & Component Matrix")
- **Status:** APPROVED_BUILD
- **Approval reference:** Gate 3 approved by user in interaction: "(Recommended) Đồng ý phê duyệt Gate 3 (Implementation Plan & 4 Phases) — Bắt đầu triển khai Phase 01 (Foundation & UI Kit)"

---

## Dependency order and ownership

1. **Phase 01 — Project Foundation & Commons UI Kit** (`AC-07`, `AC-08`)
   - File: [phases/phase-01-foundation-and-ui-kit.md](phases/phase-01-foundation-and-ui-kit.md)
   - Scope: Initialize Flutter app at workspace root (`.`), set up Clean Architecture folders, configure dependencies (`flutter_bloc`, `equatable`), build core design tokens (`AppColors`, `AppTypography`, `AppSpacing`, `AppRadius`, `AppShadows`, `theme`), and implement standardized commons UI kit widgets (`AppTextField`, `AppPrimaryButton`, `AppSecondaryButton`, `AppCheckbox`, `BalanceGradientCard`, `SecurityBadge`, `NoticeBannerBox`).
   - Owner: Code Writer

2. **Phase 02 — Authentication & Home Flow: UIT-01 & UIT-02** (`AC-01`, `AC-02`)
   - File: [phases/phase-02-auth-and-home.md](phases/phase-02-auth-and-home.md)
   - Scope: Implement `LoginPage` (UIT-01) with username/password validation, show/hide password toggle, "Ghi nhớ tên đăng nhập" checkbox, Face ID action, link to recovery flow; implement `HomePage` (UIT-02) with balance gradient card (mask/unmask balance, copy STK), 3 quick action buttons, recent transaction list, and 5-tab bottom navigation bar.
   - Owner: Code Writer

3. **Phase 03 — Recovery & OTP Verification Flow: UIT-03 & UIT-04** (`AC-03`, `AC-04`)
   - File: [phases/phase-03-recovery-and-otp.md](phases/phase-03-recovery-and-otp.md)
   - Scope: Implement `AccountVerificationPage` (UIT-03) with phone/email validation, OTP dispatch Cubit, security principles advisory box; implement `OtpVerificationPage` (UIT-04) with 6 discrete OTP digit boxes (auto-focus traversal), active 01:45 countdown timer, resend action, and inline error feedback.
   - Owner: Code Writer

4. **Phase 04 — New Password Setup & Completion Flow: UIT-05 & UIT-06** (`AC-05`, `AC-06`)
   - File: [phases/phase-04-new-password-and-completion.md](phases/phase-04-new-password-and-completion.md)
   - Scope: Implement `NewPasswordPage` (UIT-05) with 4 real-time security criteria checklist, password confirm match check, and submit button enablement; implement `ResetPasswordSuccessPage` (UIT-06) with large circular green checkmark badge, security update metadata card, and "Quay lại đăng nhập" button clearing auth recovery stack back to UIT-01.
   - Owner: Code Writer

---

## Acceptance coverage

| AC ID | Task or Phase | Decisive Check | Evidence Target |
|---|---|---|---|
| **AC-01** | Phase 02 (UIT-01 Đăng nhập) | Widget test verifies all login fields, password visibility toggle, checkbox, and navigation callbacks to UIT-02 and UIT-03. | `test/modules/auth/presentation/pages/login_page_test.dart` PASS |
| **AC-02** | Phase 02 (UIT-02 Trang chủ) | Widget test verifies balance card masking toggle, copy feedback, transaction list rendering, and bottom nav tabs. | `test/modules/home/presentation/pages/home_page_test.dart` PASS |
| **AC-03** | Phase 03 (UIT-03 Xác thực TK) | Widget test verifies phone/email validation, back navigation to UIT-01, and transition to UIT-04 on OTP dispatch. | `test/modules/auth/presentation/pages/account_verification_page_test.dart` PASS |
| **AC-04** | Phase 03 (UIT-04 Xác minh OTP) | Widget test verifies 6-box digit input entry, countdown timer display, inline error on invalid code, and transition to UIT-05. | `test/modules/auth/presentation/pages/otp_verification_page_test.dart` PASS |
| **AC-05** | Phase 04 (UIT-05 Đặt mật khẩu) | Widget test verifies live 4-criteria checklist toggling, confirm password mismatch error, and transition to UIT-06. | `test/modules/auth/presentation/pages/new_password_page_test.dart` PASS |
| **AC-06** | Phase 04 (UIT-06 Đổi MK thành công) | Widget test verifies success screen rendering, metadata card, and return-to-login navigation reset. | `test/modules/auth/presentation/pages/reset_password_success_page_test.dart` PASS |
| **AC-07** | Phase 01 (Tokens & Design System) | Analyzer and token unit tests verify all styling uses `AppColors`, `AppTypography`, `AppSpacing`, `AppRadius`. | `test/core/theme/tokens_test.dart` PASS |
| **AC-08** | Phase 01 - 04 (Clean Architecture) | `flutter analyze` passes with 0 errors and 0 warnings across all phases; all widget/bloc tests pass. | `flutter analyze` exit 0, `flutter test` exit 0 |

---

## Client checks and recovery

- **Primary Verification Commands**:
  - `flutter analyze`
  - `flutter test`
- **Fallback / Recovery**:
  - In case of dependency resolution conflicts or platform issues, clean build cache with `flutter clean && flutter pub get`.
