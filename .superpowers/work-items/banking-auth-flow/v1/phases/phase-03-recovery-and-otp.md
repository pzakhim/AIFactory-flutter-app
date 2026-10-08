# Phase 03 — Recovery & OTP Verification Flow: UIT-03 & UIT-04

- **Status:** PASSED
- **AC IDs:** AC-03, AC-04
- **Depends on:** Phase 02 (Auth & Home)
- **Input/output contract:**
  - Input: Completed Phase 01 UI kit, tokens, and Phase 02 navigation foundation.
  - Output: Fully interactive `AccountVerificationPage` (UIT-03) pixel-aligned with `screen_3_xac_thuc_tai_khoan.jpg` and `OtpVerificationPage` (UIT-04) pixel-aligned with `screen_4_xac_minh_otp.jpg`, with working navigation between UIT-01, UIT-03, and UIT-04.
- **Owned files:**
  - `lib/modules/auth/presentation/cubits/account_verification_cubit.dart`
  - `lib/modules/auth/presentation/cubits/account_verification_state.dart`
  - `lib/modules/auth/presentation/pages/account_verification_page.dart`
  - `lib/modules/auth/presentation/cubits/otp_verification_cubit.dart`
  - `lib/modules/auth/presentation/cubits/otp_verification_state.dart`
  - `lib/modules/auth/presentation/pages/otp_verification_page.dart`
  - `lib/commons/input/otp_input_group.dart`
  - `lib/modules/auth/presentation/widgets/otp_timer_resend_widget.dart`
  - `test/modules/auth/presentation/pages/account_verification_page_test.dart`
  - `test/modules/auth/presentation/pages/otp_verification_page_test.dart`
- **Owner:** Code Writer
- **Ready when:** Phase 02 passes its pass gate.

## Tasks

1. Implement `AccountVerificationCubit` and `AccountVerificationState`:
   - Validates phone number / email input format.
   - Dispatches simulated OTP request and transitions to success.
2. Implement `AccountVerificationPage` (UIT-03) matching `screen_3_xac_thuc_tai_khoan.jpg`:
   - Top App Bar with back button and title "Khôi phục mật khẩu".
   - Circular shield icon badge + pill "BẢO MẬT 2 LỚP OTP".
   - Heading "Xác thực tài khoản" + instructional subtitle.
   - Input for Phone/Email with leading user icon and trailing verified check badge.
   - Helper text explaining automatic data verification.
   - Primary button "Gửi mã OTP".
   - Advisory alert banner (`NoticeBannerBox`) on banking confidentiality rules.
   - Footer hotline link "Bạn đã đổi số điện thoại hoặc email? Gọi 1900 6868".
3. Implement `OtpInputGroup` in `lib/commons/input/otp_input_group.dart`:
   - 6 individual 48x56px boxes, auto-focus next on single digit typed, auto-focus previous on backspace.
4. Implement `OtpVerificationCubit` and `OtpVerificationState`:
   - 105-second countdown timer (01:45) ticker.
   - State handling for digit updates, completion, verification loading, success, invalid code failure, and expired state.
   - Resend OTP method resetting countdown timer.
5. Implement `OtpVerificationPage` (UIT-04) matching `screen_4_xac_minh_otp.jpg`:
   - Top App Bar with back button, title "Xác minh OTP", right step badge "Bước 2/3".
   - Title "Nhập mã xác thực" + SMS description.
   - Masked phone info card (`098***1234`) with "SMS OTP" badge.
   - `OtpInputGroup` for 6 digits.
   - Countdown timer widget (01:45) in warning color + "Gửi lại mã" action link.
   - Primary button "Xác nhận OTP".
   - Warning notice banner on OTP protection.
   - 24/7 Hotline support footer.
6. Connect navigation: `UIT-01 -> UIT-03 -> UIT-04` (and back navigation).
7. Write widget tests for `AccountVerificationPage` and `OtpVerificationPage`.

## Pass gate

- `flutter analyze` runs with 0 errors and 0 warnings.
- `flutter test test/modules/auth/presentation/pages/account_verification_page_test.dart test/modules/auth/presentation/pages/otp_verification_page_test.dart` passes 100%.
