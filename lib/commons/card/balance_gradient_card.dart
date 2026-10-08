import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_typography.dart';

/// Premium gradient balance card for the Home Dashboard matching screen_2_trang_chu.jpg.
class BalanceGradientCard extends StatefulWidget {
  const BalanceGradientCard({
    super.key,
    required this.balance,
    required this.accountNumber,
    this.accountType = 'Tài khoản thanh toán',
    this.balanceLabel = 'Số dư khả dụng',
    this.initialMasked = false,
  });

  final String balance;
  final String accountNumber;
  final String accountType;
  final String balanceLabel;
  final bool initialMasked;

  @override
  State<BalanceGradientCard> createState() => _BalanceGradientCardState();
}

class _BalanceGradientCardState extends State<BalanceGradientCard> {
  late bool _isMasked;

  @override
  void initState() {
    super.initState();
    _isMasked = widget.initialMasked;
  }

  void _toggleMask() {
    HapticFeedback.selectionClick();
    setState(() {
      _isMasked = !_isMasked;
    });
  }

  void _copyAccountNumber() {
    HapticFeedback.lightImpact();
    Clipboard.setData(ClipboardData(text: widget.accountNumber));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Đã sao chép: ${widget.accountNumber}'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: AppRadius.cardRadius,
        gradient: const LinearGradient(
          colors: [
            Color(0xFF0F4BB8),
            Color(0xFF1357D2),
            Color(0xFF1967EC),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(19, 25, 39, 0.15),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Row: Account type + Hide/Show button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF68D391),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.accountType,
                      style: AppTypography.mediumRegular.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: _toggleMask,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _isMasked ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _isMasked ? 'Hiện' : 'Ẩn',
                          style: AppTypography.smallSemiBold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            // Balance amount
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                _isMasked ? '••••••••••••' : widget.balance,
                key: ValueKey<bool>(_isMasked),
                style: AppTypography.h2.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: _isMasked ? 2.0 : 0.5,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.balanceLabel,
              style: AppTypography.smallRegular.copyWith(
                color: Colors.white.withValues(alpha: 0.75),
              ),
            ),
            const SizedBox(height: 20),
            // Bottom row: STK and Copy button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.accountNumber,
                  style: AppTypography.mediumSemiBold.copyWith(
                    color: Colors.white,
                    letterSpacing: 0.8,
                  ),
                ),
                InkWell(
                  onTap: _copyAccountNumber,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.copy_rounded,
                          size: 14,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Sao chép',
                          style: AppTypography.smallSemiBold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
