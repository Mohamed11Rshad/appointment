import 'package:appointment/core/networking/api_error_handler.dart';
import 'package:appointment/core/networking/api_result.dart';
import 'package:appointment/core/networking/api_service.dart';
import 'package:appointment/features/sign_up/data/models/signup_request_body.dart';
import 'package:appointment/features/sign_up/data/models/signup_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);
  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.register(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
