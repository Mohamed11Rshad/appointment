import 'package:appointment/core/networking/api_error_handler.dart';
import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:appointment/features/home/logic/home_cubit.dart';
import 'package:appointment/features/home/logic/home_state.dart';
import 'package:appointment/features/home/ui/widgets/doctors_list/doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is DoctorSuccess || current is DoctorError,
      builder: (context, state) {
        return state.maybeWhen(
          doctorSuccess: (doctorsList) {
            return setupSuccess(doctorsList);
          },
          doctorError: (errorHandler) {
            return setupError(errorHandler);
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupSuccess(List<Doctor?>? doctorsList) {
    return DoctorsList(doctorsList: doctorsList);
  }

  Widget setupError(ErrorHandler errorHandler) {
    return const SizedBox.shrink();
  }
}
