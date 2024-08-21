import 'package:appointment/core/networking/api_error_handler.dart';
import 'package:appointment/core/networking/api_result.dart';
import 'package:appointment/features/home/data/apis/home_api_service.dart';
import 'package:appointment/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<SpecializationsResponseModel>> getSpecializations() async {
    try {
      final response = await _homeApiService.getSpecializations();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
