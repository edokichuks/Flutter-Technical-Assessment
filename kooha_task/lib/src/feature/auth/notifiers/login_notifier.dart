import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kooha_task/src/core/domain/repositories/login_responsitory.dart';
import 'package:kooha_task/src/core/domain/repositories/user_repository.dart';
import 'package:kooha_task/src/core/helpers/helper_fxn.dart';
import 'package:kooha_task/src/core/services/config/configure_dependencies.dart';
import 'package:kooha_task/src/core/utils/app_enums.dart';
import 'package:kooha_task/src/feature/auth/data/login_impl.dart';
import 'package:kooha_task/src/feature/auth/models/login_model.dart';
import 'package:kooha_task/src/feature/auth/notifiers/login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier(this.userRepository, this.loginRepo)
      : super(LoginState.initialState());

  final UserRepository userRepository;
  final LoginRepo loginRepo;

  Future<String?> login(LoginModel data) async {
    state = state.copyWith(loadState: LoginLoadState.loading);
    try {
      final response = await loginRepo.login(data);

      if (response.status) {
        saveToken(response.data?.token ?? "no-token");

        state = state.copyWith(
          response: response.data,
          loadState: LoginLoadState.success,
        );
        toastMessage('${response.message}');
        return response.message;
      } else {
        errorToastMessage('${response.message}');
        state = state.copyWith(
            errorMessage: response.message, loadState: LoginLoadState.error);
        return response.message;
      }
    } catch (e) {
      state = state.copyWith(
        loadState: LoginLoadState.error,
        errorMessage: e.toString(),
      );
      errorToastMessage('$e');
      rethrow;
    }
  }

  saveToken(String token) {
    userRepository.saveToken(token);
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (_) => LoginNotifier(
    _.read(userRepoProvider),
    _.read(loginRepoProv),
  ),
);
