import 'package:appointment/core/helpers/extensions.dart';
import 'package:appointment/core/networking/api_error_handler.dart';
import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:appointment/features/home/data/repos/home_repo.dart';
import 'package:appointment/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(const HomeState.initial());
  final HomeRepo homeRepo;

  List<SpecializationsData?> specializationsDataList = [];

  void getSpecializations() async {
    emit(const HomeState.specializationLoading());
    final result = await homeRepo.getSpecializations();
    result.when(
      success: (specializationsResponseModel) {
        specializationsDataList =
            specializationsResponseModel.specializationDataList ?? [];

        // get the doctors list for the first specialization
        getDoctorsList(specializationId: specializationsDataList.first?.id);
        emit(
          HomeState.specializationSuccess(
            specializationDataList: specializationsDataList,
          ),
        );
      },
      failure: (errorHandler) {
        emit(
          HomeState.specializationError(errorHandler: errorHandler),
        );
      },
    );
  }

  void getDoctorsList({required int? specializationId}) async {
    List<Doctor?>? doctorsList =
        getDoctorsListBySpecializationId(specializationId);

    if (!doctorsList.isNullOrEmpty()) {
      emit(
        HomeState.doctorSuccess(doctorList: doctorsList),
      );
    } else {
      emit(
        HomeState.doctorError(
          errorHandler:
              ErrorHandler.handle("No doctors found for this specialization"),
        ),
      );
    }
  }

  /// returns the list of doctors based on the specialization id
  List<Doctor?>? getDoctorsListBySpecializationId(int? specializationId) {
    final specializationsData = specializationsDataList.firstWhere(
      (specialization) => specialization?.id == specializationId,
    );
    return specializationsData?.doctorsList;
  }
}
