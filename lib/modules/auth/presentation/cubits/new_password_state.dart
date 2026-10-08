import '../../../../core/bloc/base_bloc_state.dart';

class NewPasswordState extends BaseBlocState {
  const NewPasswordState({
    this.newPassword = '',
    this.confirmPassword = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  final String newPassword;
  final String confirmPassword;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  bool get hasLength => newPassword.length >= 8 && newPassword.length <= 20;
  bool get hasUpperAndLower =>
      RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(newPassword);
  bool get hasDigit => RegExp(r'\d').hasMatch(newPassword);
  bool get hasSpecialChar =>
      RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(newPassword);

  bool get isPasswordRulesMet =>
      hasLength && hasUpperAndLower && hasDigit && hasSpecialChar;

  bool get isConfirmMatched =>
      confirmPassword.isNotEmpty && newPassword == confirmPassword;

  bool get isAllValid => isPasswordRulesMet && isConfirmMatched;

  NewPasswordState copyWith({
    String? newPassword,
    String? confirmPassword,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool clearError = false,
  }) {
    return NewPasswordState(
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [
        newPassword,
        confirmPassword,
        isLoading,
        isSuccess,
        errorMessage,
      ];
}
