# Banking Authentication & Password Recovery Flow

- **Type:** feature
- **Version:** v1
- **Status:** APPROVED_REQUIREMENTS
- **Outcome:** A complete, pixel-accurate Flutter mobile application implementing the 6-screen Banking Authentication & Password Recovery Flow (`UIT-01` to `UIT-06`), conforming strictly to the provided Design System (`Design_System.md`), specifications (`Spec_Banking.md`), and UI visual assets (`huly/designed/banking/logging/`).
- **Owner:** coordinator
- **Risk:** Medium — initialization of a new Flutter project, multi-step interactive state flows (OTP countdown timer, real-time password criteria validation, masked account balance, biometric triggers).
- **Related items:** NONE
- **Sources:**
  - User Prompt: "cài đặt một app mobile giao diện trước mắt sẽ chỉ có logging thôi @huly/designed/banking/logging"
  - Functional Specification: `huly/designed/banking/Spec_Banking.md`
  - Design Tokens & Components: `huly/designed/banking/Design_System.md`
  - Visual Reference Mockups:
    - Screen 1: `huly/designed/banking/logging/screen_1_dang_nhap.jpg` (UIT-01: Đăng nhập)
    - Screen 2: `huly/designed/banking/logging/screen_2_trang_chu.jpg` (UIT-02: Trang chủ sau đăng nhập)
    - Screen 3: `huly/designed/banking/logging/screen_3_xac_thuc_tai_khoan.jpg` (UIT-03: Xác thực tài khoản khôi phục mật khẩu)
    - Screen 4: `huly/designed/banking/logging/screen_4_xac_minh_otp.jpg` (UIT-04: Xác minh OTP 6 số)
    - Screen 5: `huly/designed/banking/logging/screen_5_dat_mat_khau_moi.jpg` (UIT-05: Đặt mật khẩu mới)
    - Screen 6: `huly/designed/banking/logging/screen_6_doi_mat_khau_thanh_cong.jpg` (UIT-06: Đổi mật khẩu thành công)
- **Approval references:** Gate 1 approved by user in interaction: "(Recommended) Đồng ý phê duyệt Gate 1 (Requirements Brief) — Tiến hành Gate 2: Thiết kế chi tiết & Bảng linh kiện (Design & Component Matrix)"

---

## Existing behavior and target

### Existing Behavior (Baseline)
- Workspace currently contains only project documentation, design specs, and agent configurations.
- No Flutter project or application code exists (`pubspec.yaml`, `lib/`, `test/` are absent).

### Target Behavior
- An operational Flutter mobile application running on iOS/Android (390px base responsive viewport).
- Full interactive implementation of the 6 core banking screens with end-to-end user navigation:
  1. **UIT-01 (Đăng nhập)**: Login with account/CCCD and password, password visibility toggle, "Ghi nhớ tên đăng nhập" checkbox, Face ID action, link to recovery flow, and submission to Home.
  2. **UIT-02 (Trang chủ)**: Display greeting, avatar, notification bell, interactive balance card (hide/show balance, copy account number), quick action buttons (Chuyển tiền, Hóa đơn, Nạp tiền), recent transaction feed, and 5-tab bottom navigation bar.
  3. **UIT-03 (Xác thực tài khoản)**: Phone/email input with formatting/validation, security advisory callout, and OTP request submission.
  4. **UIT-04 (Xác minh OTP)**: 6 individual OTP digit boxes with auto-focus traversal, active 01:45 countdown timer, resend OTP trigger, inline error alerts, and verification submission.
  5. **UIT-05 (Đặt mật khẩu mới)**: New password entry with visibility toggle, live 4-criteria security checklist (8-20 chars, upper & lower case, number, special char), password confirmation matching, and submission.
  6. **UIT-06 (Đổi mật khẩu thành công)**: Success badge, update metadata card, security reminder, and "Quay lại đăng nhập" button returning to UIT-01 with reset auth state.
- Pure Clean Architecture structure:
  - `lib/core/`: Design tokens, theme, routing, dependency injection.
  - `lib/commons/`: Standardized UI kit components (buttons, text fields, badges, cards).
  - `lib/modules/auth/`: Domain entities, use cases, repository contracts, mock data sources, BLoC/Cubit state management, and UI pages for UIT-01, UIT-03, UIT-04, UIT-05, UIT-06.
  - `lib/modules/home/`: Home dashboard UI and BLoC for UIT-02.

---

## Scope and contracts

### In Scope
1. **Project Initialization**: Flutter application scaffolded with Dart 3.x and stable Flutter SDK.
2. **Design System & Tokens**:
   - `AppColors`: Primary brand indigo (`#4E61F6`), greys (`#F9FAFB` to `#131927`), functional success/error/warning/info.
   - `AppTypography`: `Inter` font family hierarchy (Display 48px, H1-H4, Large/Medium/Small/Tiny).
   - `AppSpacing` & `AppRadius`: Strict 4px grid and standard 8px/12px/20px/pill corner radius scale.
   - Shadows and elevation per Section 5 of `Design_System.md`.
3. **Reusable Commons / UI Kit**:
   - `AppPrimaryButton`, `AppSecondaryButton`, `AppIconButton`.
   - `AppTextField` with floating/fixed labels, prefix/suffix icons, show/hide password, and inline error states.
   - `OtpInputGroup` for 6-box OTP entry.
   - `BalanceGradientCard` with hide/show balance and copy action.
   - `SecurityTrustBadge` and `NoticeAlertBanner`.
4. **6 UI Touchpoint Screens**:
   - Complete layout, pixel-aligned with `screen_1_dang_nhap.jpg` through `screen_6_doi_mat_khau_thanh_cong.jpg`.
5. **State Management & Logic (flutter_bloc / cubit)**:
   - `AuthBloc` / `AuthCubit`: Login validation, remember me, biometric simulation, password reset flow state transitions.
   - `OtpCubit`: Countdown ticker, resend cooldown, digit validation.
   - `PasswordValidationCubit`: Live regex validation against all 4 banking security rules.
   - `HomeCubit`: Balance visibility toggle, tab switching.
6. **Testing & Quality Assurance**:
   - Widget tests for all 6 screens verifying rendering and interaction.
   - Zero `flutter analyze` linter warnings.

### Out of Scope
- Integration with external backend production servers (uses clean repository pattern with local mock implementations).
- Native hardware biometric hardware enrolling (simulated biometric prompt).
- Real SMS gateway dispatch (mocked with predictable OTP verification).

---

## Acceptance and checks

| AC ID | Observable Result | Source | Decisive Check |
|---|---|---|---|
| **AC-01** | **UIT-01 Đăng nhập**: Displays DigiBank branding, username & password fields, show/hide password toggle, "Ghi nhớ tên đăng nhập" checkbox, "Quên mật khẩu?" link, primary "Đăng nhập" button, outline "Đăng nhập bằng Face ID" button, SSL encryption badge, and 24/7 hotline footer. Tapping "Đăng nhập" with valid input navigates to UIT-02; tapping "Quên mật khẩu?" navigates to UIT-03. | `Spec_Banking.md#UIT-01`, `Design_System.md#8`, `screen_1_dang_nhap.jpg` | Widget test verifies all element keys, toggle visibility, checkbox interaction, and navigation to UIT-02 and UIT-03. |
| **AC-02** | **UIT-02 Trang chủ sau đăng nhập**: Displays top bar with avatar ("NA"), greeting "Xin chào, Nguyễn Văn An", search and notification icons. Balance card shows "128.450.000 đ", mask toggle, account "1088 •••• 9928" with copy button. Quick actions (Chuyển tiền, Hóa đơn, Nạp tiền). Recent transaction list with formatted amounts (+Green/-Dark). 5-tab bottom navigation with active Home indicator. | `Spec_Banking.md#UIT-02`, `Design_System.md#8`, `screen_2_trang_chu.jpg` | Widget test verifies balance card masking toggle, copy interaction feedback, transaction list rendering, and tab navigation. |
| **AC-03** | **UIT-03 Xác thực tài khoản**: Displays back button, title "Khôi phục mật khẩu", badge "BẢO MẬT 2 LỚP OTP", title "Xác thực tài khoản", phone/email input with format validation, helper text, primary "Gửi mã OTP" button, security principles card, and support footer. Valid submit transitions to UIT-04; back button returns to UIT-01. | `Spec_Banking.md#UIT-03`, `Design_System.md#8`, `screen_3_xac_thuc_tai_khoan.jpg` | Widget test verifies input validation error state, back navigation, and successful navigation to UIT-04 on OTP dispatch. |
| **AC-04** | **UIT-04 Xác minh OTP**: Displays back button, title "Xác minh OTP", badge "Bước 2/3", phone target card (`098***1234`), 6 discrete OTP digit boxes with auto-advance, active countdown timer (01:45), "Gửi lại mã" link, primary "Xác nhận OTP" button, security notice box, and hotline. Submitting 6 digits navigates to UIT-05; invalid code shows inline error. Back returns to UIT-03. | `Spec_Banking.md#UIT-04`, `Design_System.md#8`, `screen_4_xac_minh_otp.jpg` | Widget test verifies 6-box digit input entry, countdown timer display, inline error on invalid code, and navigation to UIT-05 on success. |
| **AC-05** | **UIT-05 Đặt mật khẩu mới**: Displays back button, title "Đặt mật khẩu mới", help icon, badge "BƯỚC 3 / 3 • BẢO MẬT", new password field, live 4-criteria checklist (8-20 chars, upper & lower case, digit, special character), confirm password field, primary "Cập nhật mật khẩu" button (disabled until valid), and PCI compliance footer. Valid submit transitions to UIT-06. Mismatch shows inline error. | `Spec_Banking.md#UIT-05`, `Design_System.md#8`, `screen_5_dat_mat_khau_moi.jpg` | Widget test verifies real-time criteria status toggling, confirm password mismatch error, button enablement state, and transition to UIT-06. |
| **AC-06** | **UIT-06 Đổi mật khẩu thành công**: Displays centered circular green checkmark badge (80x80px), title "Đổi mật khẩu thành công", description copy, security detail card (update time, SMS OTP method, previous session notice), security advisory callout, and primary "Quay lại đăng nhập" button. Tapping button returns to UIT-01, clearing auth recovery stack. | `Spec_Banking.md#UIT-06`, `Design_System.md#8`, `screen_6_doi_mat_khau_thanh_cong.jpg` | Widget test verifies success screen rendering, detail card metadata, and return-to-login navigation reset. |
| **AC-07** | **Design System & Token Conformance**: All colors, typography, spacing, radius, and shadows strictly use defined design tokens from `Design_System.md`. Zero hardcoded arbitrary styling values. Inter font family configured. | `Design_System.md#2, #3, #4, #5, #9` | Static code audit confirms all widgets reference `AppColors`, `AppTypography`, `AppSpacing`, `AppRadius`. |
| **AC-08** | **Clean Architecture & Code Quality**: Follows Clean Architecture structure (`core/`, `commons/`, `modules/`). No domain dependencies on presentation/data layers. `flutter analyze` passes with 0 errors and 0 warnings. | `flutter-clean-architecture`, `coder-nexus` blueprint | Execution of `flutter analyze` and `flutter test` completes with 100% pass rate. |

---

## Tasks and verification

- Upon user approval of this brief (Gate 1), the following sequence will proceed:
  1. Complete `design.md` covering UI components discovery matrix, state transitions, and router architecture for Gate 2 approval.
  2. Implement Phase Breakdown (`implement-plan.md` and phase files) for Gate 3 approval.
  3. Incremental implementation via Code Writer, independent review via Code Reviewer, verification via Test Runner, and documentation via Docs Writer.

---

## Decisions and blockers

### Decisions Required from User (Gate 1 Review)
1. **Scope & Requirements Alignment**: Please confirm that the 6 screens (`UIT-01` to `UIT-06`) and the 8 Acceptance Criteria (`AC-01` to `AC-08`) capture your full expectations for this feature.
2. **Project Initialization Location**: Confirm creating the Flutter project directly in the workspace root (`/Users/gshmac/Space/CodeSpace/AIFactory-flutter-app`).
3. **State Management**: Confirm using `flutter_bloc` / Cubit with Clean Architecture as standard for the project.

### Host Subagent Invocation Capability Status
- Independent background subagent CLI invocation is unavailable in this environment session; the Antigravity host coordinator is executing the Coder Nexus roles sequentially with full gate enforcement and evidence tracking.
