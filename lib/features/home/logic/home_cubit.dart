import 'package:appointment/core/networking/api_error_handler.dart';
import 'package:appointment/features/home/data/repos/home_repo.dart';
import 'package:appointment/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(const HomeState.initial());
  final HomeRepo homeRepo;

  void getSpecializations() async {
    emit(const HomeState.specializationLoading());
    final result = await homeRepo.getSpecializations();
    result.when(
      success: (specializationsResponseModel) {
        emit(
          HomeState.specializationSuccess(
            specializationsResponseModel: specializationsResponseModel,
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
}
