import 'package:flutter_bloc/flutter_bloc.dart';
import 'account_verification_state.dart';

class AccountVerificationCubit extends Cubit<AccountVerificationState> {
  AccountVerificationCubit() : super(const AccountVerificationState());

  void onContactChanged(String value) {
    emit(state.copyWith(contactInput: value, clearError: true));
  }

  Future<void> submit() async {
    if (!state.isValidContact) {
      emit(state.copyWith(
        errorMessage: 'Vui lòng nhập Số điện thoại hoặc Email hợp lệ',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, clearError: true));
    await Future.delayed(const Duration(milliseconds: 600));
    emit(state.copyWith(isLoading: false, isSuccess: true));
  }
}
