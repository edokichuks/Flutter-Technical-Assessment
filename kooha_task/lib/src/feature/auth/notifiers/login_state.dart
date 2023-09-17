
import 'package:kooha_task/src/core/utils/app_enums.dart';
import 'package:kooha_task/src/feature/auth/models/login_response.dart';

class LoginState {
  final LoginLoadState loadState;
  final LoginResponse? response;
  final String errorMessage;
  LoginState({
    required this.loadState,
    this.response,
    this.errorMessage = '',
  });

  factory LoginState.initialState() {
    return LoginState(
      loadState: LoginLoadState.idle,
      errorMessage: '',
      response: null,
    );
  }

  LoginState copyWith({
    LoginLoadState? loadState,
    LoginResponse? response,
    String? errorMessage,
  }) {
    return LoginState(
      loadState: loadState ?? this.loadState,
      response: response ?? this.response,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
