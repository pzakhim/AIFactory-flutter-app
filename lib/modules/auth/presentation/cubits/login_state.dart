import '../../../../core/bloc/base_bloc_state.dart';

class LoginState extends BaseBlocState {
  const LoginState({
    this.username = '',
    this.password = '',
    this.rememberMe = false,
    this.isLoading = false,
    this.isSuccess = false,
    this.errorMessage,
    this.passwordError,
  });

  final String username;
  final String password;
  final bool rememberMe;
  final bool isLoading;
  final bool isSuccess;
  final String? errorMessage;
  final String? passwordError;

  bool get isFormValid => username.trim().isNotEmpty && password.trim().isNotEmpty;

  LoginState copyWith({
    String? username,
    String? password,
    bool? rememberMe,
    bool? isLoading,
    bool? isSuccess,
    String? errorMessage,
    String? passwordError,
    bool clearErrors = false,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: clearErrors ? null : (errorMessage ?? this.errorMessage),
      passwordError: clearErrors ? null : (passwordError ?? this.passwordError),
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
        rememberMe,
        isLoading,
        isSuccess,
        errorMessage,
        passwordError,
      ];
}
