import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/config/router/app_route.dart';
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

  void resetMessage() {
    state = state.copyWith(showMessage: false);
  }

  //Login
  Future<void> login(
      BuildContext context, String username, String password) async {
    state = state.copyWith(isLoading: true);
    final result = await authUseCase.login(username, password);
    state = state.copyWith(isLoading: false);
    result.fold(
      (failure) => state = state.copyWith(
        error: failure.error,
        showMessage: true,
      ),
      (success) {
        state = state.copyWith(
          isLoading: false,
          showMessage: true,
          error: null,
        );

        Navigator.popAndPushNamed(context, AppRoute.homeRoute);
      },
    );
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      showMessage: false,
    );
  }
}
