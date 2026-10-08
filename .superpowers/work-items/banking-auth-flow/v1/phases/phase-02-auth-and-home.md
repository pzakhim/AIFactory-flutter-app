# Phase 02 — Authentication & Home Flow: UIT-01 & UIT-02

- **Status:** PASSED
- **AC IDs:** AC-01, AC-02
- **Depends on:** Phase 01 (Foundation & UI Kit)
- **Input/output contract:**
  - Input: Completed Phase 01 tokens, theme, and UI kit components.
  - Output: Fully interactive `LoginPage` (UIT-01) pixel-aligned with `screen_1_dang_nhap.jpg` and `HomePage` (UIT-02) pixel-aligned with `screen_2_trang_chu.jpg`, with working navigation between them.
- **Owned files:**
  - `lib/modules/auth/domain/entities/user_entity.dart`
  - `lib/modules/auth/presentation/cubits/login_cubit.dart`
  - `lib/modules/auth/presentation/cubits/login_state.dart`
  - `lib/modules/auth/presentation/pages/login_page.dart`
  - `lib/modules/home/presentation/cubits/home_cubit.dart`
  - `lib/modules/home/presentation/cubits/home_state.dart`
  - `lib/modules/home/presentation/pages/home_page.dart`
  - `lib/modules/home/presentation/widgets/quick_action_card.dart`
  - `lib/modules/home/presentation/widgets/transaction_item_tile.dart`
  - `lib/commons/navigation/banking_bottom_nav_bar.dart`
  - `lib/core/routes/app_routes.dart`
  - `test/modules/auth/presentation/pages/login_page_test.dart`
  - `test/modules/home/presentation/pages/home_page_test.dart`
- **Owner:** Code Writer
- **Ready when:** Phase 01 passes its pass gate.

## Tasks

1. Implement `LoginCubit` and `LoginState` supporting username/password validation, show/hide password toggle, "Ghi nhớ tên đăng nhập" checkbox, Face ID simulation, loading state, and error handling (`auth_failure` inline error).
2. Implement `LoginPage` (UIT-01) matching `screen_1_dang_nhap.jpg`:
   - Top DigiBank shield logo + "DIGIBANK - NGÂN HÀNG SỐ AN TOÀN".
   - Heading "Đăng nhập" + subtitle.
   - White card container with username and password fields.
   - Checkbox "Ghi nhớ tên đăng nhập" + Link "Quên mật khẩu?".
   - Primary button "Đăng nhập ->" + outline button "Đăng nhập bằng Face ID".
   - Security trust badge "Bảo mật mã hóa 256-bit SSL & PCI DSS".
   - 24/7 Hotline support footer.
3. Implement `HomePage` (UIT-02) matching `screen_2_trang_chu.jpg`:
   - Top Bar with circular avatar "NA", greeting "Xin chào, Nguyễn Văn An", search and notification bell buttons.
   - `BalanceGradientCard` displaying "128.450.000 đ", "Số dư khả dụng", STK "1088 •••• 9928", mask/unmask toggle, and copy account number button.
   - 3 Quick action cards ("Chuyển tiền", "Hóa đơn", "Nạp tiền").
   - "Giao dịch gần đây" section with "Xem tất cả >" link.
   - 4 Transaction items with green positive (+2.500.000 đ) and dark negative amounts, badges, and subtitles.
   - `BankingBottomNavBar` with 5 tabs (Trang chủ, Chuyển tiền, center QR scan button, Thông báo, Cài đặt).
4. Configure route transitions between `LoginPage` and `HomePage`.
5. Write widget tests for `LoginPage` and `HomePage`.

## Pass gate

- `flutter analyze` runs with 0 errors and 0 warnings.
- `flutter test test/modules/auth/presentation/pages/login_page_test.dart test/modules/home/presentation/pages/home_page_test.dart` passes 100%.
