import 'package:appointment/core/networking/api_error_model.dart';
import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // Specializations
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
          {required List<SpecializationsData?>? specializationDataList}) =
      SpecializationSuccess;
  const factory HomeState.specializationError(
      {required ApiErrorModel apiErrorModel}) = SpecializationError;

  // Doctors
  const factory HomeState.doctorSuccess({required List<Doctor?>? doctorList}) =
      DoctorSuccess;
  const factory HomeState.doctorEmpty() = DoctorEmpty;
}
