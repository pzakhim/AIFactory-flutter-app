import '../../../../core/bloc/base_bloc_state.dart';

class OtpVerificationState extends BaseBlocState {
  const OtpVerificationState({
    this.otp = '',
    this.secondsRemaining = 105,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  final String otp;
  final int secondsRemaining;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  bool get isComplete => otp.length == 6;
  bool get isExpired => secondsRemaining <= 0;
  bool get canResend => isExpired;

  String get formattedTime {
    final minutes = (secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsRemaining % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  OtpVerificationState copyWith({
    String? otp,
    int? secondsRemaining,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool clearError = false,
  }) {
    return OtpVerificationState(
      otp: otp ?? this.otp,
      secondsRemaining: secondsRemaining ?? this.secondsRemaining,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        otp,
        secondsRemaining,
        isLoading,
        isSuccess,
        errorMessage,
      ];
}
