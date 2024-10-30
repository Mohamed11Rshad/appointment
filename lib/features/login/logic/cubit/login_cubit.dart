import 'package:appointment/core/helpers/constants.dart';
import 'package:appointment/core/helpers/shared_pref_helper.dart';
import 'package:appointment/core/networking/dio_factory.dart';
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

  void emitLoginState() async {
    emit(const LoginState.loginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (loginResponse) async {
        await saveUserToken(loginResponse.userData?.token ?? '');
        emit(
          LoginState.loginSuccess(
            loginResponse,
          ),
        );
      },
      failure: (apiErrorModel) {
        emit(
          LoginState.loginFailure(
            apiErrorModel: apiErrorModel,
          ),
        );
      },
    );
  }

  saveUserToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    DioFactory.setToken(token);
  }
}
