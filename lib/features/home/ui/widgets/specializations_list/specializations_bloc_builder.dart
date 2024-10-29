import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:appointment/features/home/logic/home_cubit.dart';
import 'package:appointment/features/home/logic/home_state.dart';
import 'package:appointment/features/home/ui/widgets/specializations_list/doctor_speciality_list.dart';
import 'package:appointment/features/home/ui/widgets/doctors_list/doctors_shimmer_loading.dart';
import 'package:appointment/features/home/ui/widgets/specializations_list/speciality_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecizlizationsBlocBuilder extends StatelessWidget {
  const SpecizlizationsBlocBuilder({
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
          specializationSuccess: (specializationsDataList) {
            var specializationsList = specializationsDataList;
            return setupSuccess(specializationsDataList: specializationsList);
          },
          specializationError: (errorHandler) => setupError(),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          verticalSpace(16),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

  Widget setupError() {
    return const SizedBox.shrink();
  }

  Widget setupSuccess(
      {required List<SpecializationsData?>? specializationsDataList}) {
    return DoctorSpecialityList(
      specializationsDataList: specializationsDataList ?? [],
    );
  }
}
