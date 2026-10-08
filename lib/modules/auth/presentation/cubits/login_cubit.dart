import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void onUsernameChanged(String value) {
    emit(state.copyWith(username: value, clearErrors: true));
  }

  void onPasswordChanged(String value) {
    emit(state.copyWith(password: value, clearErrors: true));
  }

  void onRememberMeChanged(bool value) {
    emit(state.copyWith(rememberMe: value));
  }

  Future<void> login() async {
    if (!state.isFormValid) {
      if (state.password.trim().isEmpty) {
        emit(state.copyWith(passwordError: 'Vui lòng nhập mật khẩu của bạn'));
      }
      return;
    }

    emit(state.copyWith(isLoading: true, clearErrors: true));
    await Future.delayed(const Duration(milliseconds: 600));

    // Simulated credential check
    if (state.password.length < 6) {
      emit(state.copyWith(
        isLoading: false,
        passwordError: 'Mật khẩu phải từ 6 ký tự trở lên',
      ));
      return;
    }

    emit(state.copyWith(isLoading: false, isSuccess: true));
  }

  Future<void> loginWithBiometrics() async {
    emit(state.copyWith(isLoading: true, clearErrors: true));
    await Future.delayed(const Duration(milliseconds: 600));
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}
