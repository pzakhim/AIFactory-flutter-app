import '../../../../core/bloc/base_bloc_state.dart';

class AccountVerificationState extends BaseBlocState {
  const AccountVerificationState({
    this.contactInput = '',
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  final String contactInput;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;

  bool get isValidContact {
    final trimmed = contactInput.trim();
    if (trimmed.isEmpty) return false;
    final isPhone = RegExp(r'^(0[3|5|7|8|9])+([0-9]{8})$').hasMatch(trimmed.replaceAll(' ', ''));
    final isEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(trimmed);
    return isPhone || isEmail || trimmed.length >= 9;
  }

  AccountVerificationState copyWith({
    String? contactInput,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    bool clearError = false,
  }) {
    return AccountVerificationState(
      contactInput: contactInput ?? this.contactInput,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  List<Object?> get props => [contactInput, isLoading, isSuccess, errorMessage];
}
