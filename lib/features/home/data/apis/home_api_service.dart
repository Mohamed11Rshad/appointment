import 'package:appointment/core/networking/api_constants.dart';
import 'package:appointment/features/home/data/apis/home_api_constants.dart';
import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstants.specializationEB)
  Future<SpecializationsResponseModel> getSpecializations();
}
