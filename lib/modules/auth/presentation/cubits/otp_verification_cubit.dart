import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit() : super(const OtpVerificationState()) {
    _startTimer();
  }

  Timer? _timer;

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.secondsRemaining > 0) {
        emit(state.copyWith(secondsRemaining: state.secondsRemaining - 1));
      } else {
        _timer?.cancel();
      }
    });
  }

  void onOtpChanged(String value) {
    emit(state.copyWith(otp: value, clearError: true));
  }

  void resendOtp() {
    emit(state.copyWith(secondsRemaining: 105, clearError: true));
    _startTimer();
  }

  Future<void> submitOtp() async {
    if (!state.isComplete) {
      emit(state.copyWith(errorMessage: 'Vui lòng nhập đủ 6 chữ số mã OTP'));
      return;
    }

    if (state.isExpired) {
      emit(state.copyWith(errorMessage: 'Mã OTP đã hết hiệu lực. Vui lòng bấm Gửi lại mã'));
      return;
    }

    emit(state.copyWith(isLoading: true, clearError: true));
    await Future.delayed(const Duration(milliseconds: 600));

    // Simulated rejection of '000000'
    if (state.otp == '000000') {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'Mã OTP không chính xác. Vui lòng thử lại',
      ));
      return;
    }

    _timer?.cancel();
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
