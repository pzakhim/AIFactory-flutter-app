import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../commons/card/balance_gradient_card.dart';
import '../../../../commons/navigation/banking_bottom_nav_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_typography.dart';
import '../cubits/home_cubit.dart';
import '../cubits/home_state.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/transaction_item_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();

          return Scaffold(
            backgroundColor: const Color(0xFFF7F9FC),
            body: SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top App Header
                    Row(
                      children: [
                        // Avatar NA
                        Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            color: Color(0xFF0F4BB8),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'NA',
                            style: AppTypography.mediumSemiBold.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Xin chào,',
                                style: AppTypography.smallRegular.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              Text(
                                'Nguyễn Văn An',
                                style: AppTypography.mediumSemiBold.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Search Button
                        _buildCircleIconButton(
                          icon: Icons.search_rounded,
                          onTap: () {},
                        ),
                        const SizedBox(width: 10),
                        // Bell Notification Button
                        _buildCircleIconButton(
                          icon: Icons.notifications_none_rounded,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Main Balance Card
                    const BalanceGradientCard(
                      balance: '128.450.000 đ',
                      accountNumber: 'STK: 1088 •••• 9928',
                      accountType: 'Tài khoản thanh toán',
                      balanceLabel: 'Số dư khả dụng',
                    ),
                    const SizedBox(height: 20),

                    // 3 Quick Action Cards
                    Row(
                      children: [
                        QuickActionCard(
                          title: 'Chuyển tiền',
                          icon: Icons.north_east_rounded,
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        QuickActionCard(
                          title: 'Hóa đơn',
                          icon: Icons.receipt_long_outlined,
                          onTap: () {},
                        ),
                        const SizedBox(width: 12),
                        QuickActionCard(
                          title: 'Nạp tiền',
                          icon: Icons.add_circle_outline_rounded,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Section Title: Recent Transactions
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Giao dịch gần đây',
                          style: AppTypography.h4.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                'Xem tất cả',
                                style: AppTypography.smallSemiBold.copyWith(
                                  color: const Color(0xFF0F4CD9),
                                ),
                              ),
                              const SizedBox(width: 2),
                              const Icon(
                                Icons.chevron_right_rounded,
                                size: 16,
                                color: Color(0xFF0F4CD9),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Transactions Container List
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.surfaceWhite,
                        borderRadius: AppRadius.cardRadius,
                        boxShadow: AppShadows.shadow100,
                      ),
                      child: Column(
                        children: [
                          TransactionItemTile(
                            title: 'Trần Thị Mai',
                            subtitle: 'Hôm nay, 08:30',
                            amount: '+2.500.000 đ',
                            isPositive: true,
                            icon: Icons.south_west_rounded,
                            iconColor: AppColors.success,
                            iconBgColor: AppColors.green50,
                          ),
                          const Divider(height: 1, color: Color(0xFFF1F3F6)),
                          const TransactionItemTile(
                            title: 'Điện lực EVN Hà Nội',
                            subtitle: 'Hôm qua, 19:15',
                            amount: '-845.000 đ',
                            isPositive: false,
                            icon: Icons.bolt_rounded,
                            iconColor: Color(0xFF0095FF),
                            iconBgColor: Color(0xFFEBF6FF),
                          ),
                          const Divider(height: 1, color: Color(0xFFF1F3F6)),
                          const TransactionItemTile(
                            title: 'QR WinMart',
                            subtitle: '22 Th09, 14:20',
                            amount: '-312.000 đ',
                            isPositive: false,
                            icon: Icons.storefront_rounded,
                            iconColor: Color(0xFFE89B00),
                            iconBgColor: Color(0xFFFFF7E6),
                          ),
                          const Divider(height: 1, color: Color(0xFFF1F3F6)),
                          const TransactionItemTile(
                            title: 'Ví điện tử MoMo',
                            subtitle: '21 Th09, 10:05',
                            amount: '-500.000 đ',
                            isPositive: false,
                            icon: Icons.account_balance_wallet_outlined,
                            iconColor: Color(0xFF0F8DF7),
                            iconBgColor: Color(0xFFEBF6FF),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BankingBottomNavBar(
              currentIndex: state.currentTabIndex,
              onTap: cubit.setTabIndex,
            ),
          );
        },
      ),
    );
  }

  Widget _buildCircleIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.surfaceWhite,
          shape: BoxShape.circle,
          boxShadow: AppShadows.shadow100,
        ),
        child: Icon(
          icon,
          size: 20,
          color: AppColors.iconBlack,
        ),
      ),
    );
  }
}
