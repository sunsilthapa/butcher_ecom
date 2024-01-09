class AuthState {
  final bool isLoading;
  final String? error;
  final bool showMessage;

  AuthState({
    required this.isLoading,
    required this.error,
    required this.showMessage,
  });

  factory AuthState.initialState() => AuthState(
        isLoading: false,
        error: null,
        showMessage: false,
      );

  AuthState copyWith({
    bool? isLoading,
    String? error,
    bool? showMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      showMessage: showMessage ?? this.showMessage,
    );
  }

    @override
  String toString() =>
      'AuthState(isLoading: $isLoading, error: $error, showMessage: $showMessage)';
}


