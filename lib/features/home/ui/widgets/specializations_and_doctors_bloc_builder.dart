import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:appointment/features/home/logic/home_cubit.dart';
import 'package:appointment/features/home/logic/home_state.dart';
import 'package:appointment/features/home/ui/widgets/doctor_speciality_list.dart';
import 'package:appointment/features/home/ui/widgets/doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecizlizationsAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecizlizationsAndDoctorsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationLoading ||
          current is SpecializationSuccess ||
          current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () {
            return setupLoading();
          },
          specializationSuccess: (specializationsResponseModel) {
            var specializationsDataList =
                specializationsResponseModel.specializationDataList;
            return setupSuccess(
                specializationsDataList: specializationsDataList);
          },
          specializationError: (errorHandler) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupSuccess(
      {required List<SpecializationsData?>? specializationsDataList}) {
    return Expanded(
      child: Column(
        children: [
          DoctorSpecialityList(
            specializationsDataList: specializationsDataList ?? [],
          ),
          verticalSpace(16),
          DoctorsList(
            doctorsList: specializationsDataList?.first?.doctorsList ?? [],
          ),
        ],
      ),
    );
  }
}
