import 'package:flutter_bloc/flutter_bloc.dart';
import 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(const NewPasswordState());

  void onNewPasswordChanged(String value) {
    emit(state.copyWith(newPassword: value, clearError: true));
  }

  void onConfirmPasswordChanged(String value) {
    emit(state.copyWith(confirmPassword: value, clearError: true));
  }

  Future<void> updatePassword() async {
    if (!state.isPasswordRulesMet) {
      emit(state.copyWith(
        errorMessage: 'Mật khẩu chưa đáp ứng đủ tiêu chuẩn an ninh ngân hàng',
      ));
      return;
    }

    if (!state.isConfirmMatched) {
      emit(state.copyWith(
        errorMessage: 'Mật khẩu xác nhận không khớp. Vui lòng kiểm tra lại',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, clearError: true));
    await Future.delayed(const Duration(milliseconds: 600));
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}
