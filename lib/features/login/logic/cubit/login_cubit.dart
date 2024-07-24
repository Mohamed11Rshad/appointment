import 'package:appointment/features/login/data/models/login_request_body.dart';
import 'package:appointment/features/login/data/repos/login_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginState(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (loginResponse) {
        emit(
          LoginState.success(
            loginResponse,
          ),
        );
      },
      failure: (error) {
        emit(
          LoginState.failure(
            error: error.apiErrorModel.message ?? '',
          ),
        );
      },
    );
  }
}
