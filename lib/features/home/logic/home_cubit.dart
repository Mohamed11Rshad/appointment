import 'package:appointment/features/home/data/repos/home_repo.dart';
import 'package:appointment/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  final HomeRepo _homeRepo;

  void getSpecializations() async {
    emit(const HomeState.specializationLoading());
    final reponse = await _homeRepo.getSpecializations();
    reponse.when(
      success: (specializationResponseModel) {
        emit(HomeState.specializationLSuccess(specializationResponseModel));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationLError(errorHandler));
      },
    );
  }
}
