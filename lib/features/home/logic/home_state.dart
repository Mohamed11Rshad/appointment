import 'package:appointment/core/networking/api_error_handler.dart';
import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationLSuccess(
          SpecializationsResponseModel specializationResponseModel) =
      SpecializationLSuccess;
  const factory HomeState.specializationLError(ErrorHandler errorHandler) =
      SpecializationLError;
}
