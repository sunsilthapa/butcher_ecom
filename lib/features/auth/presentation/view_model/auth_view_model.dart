import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/features/auth/domain/entity/auth_entity.dart';
import 'package:meat_shop/features/auth/domain/usecase/auth_usecase.dart';
import 'package:meat_shop/features/auth/presentation/state/auth_state.dart';

final authViewModelProvider = StateNotifierProvider.autoDispose<AuthViewModel, AuthState>((ref) =>
AuthViewModel(authUseCase: ref.read(authUseCaseProvider))
);

class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel({required this.authUseCase}) : super(AuthState.initialState());

  final AuthUseCase authUseCase;
  void addUser(AuthEntity user) {
    state = state.copyWith(isLoading: true);

    authUseCase.addUser(user).then((value) {
      value.fold(
          (failure) => state = state.copyWith(isLoading: false),
          (success) => state =
              state.copyWith(isLoading: false, showMessage: true,));
    });
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }

}
