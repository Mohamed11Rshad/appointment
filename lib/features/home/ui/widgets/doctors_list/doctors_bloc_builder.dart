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
          current is DoctorSuccess || current is DoctorEmpty,
      builder: (context, state) {
        return state.maybeWhen(
          doctorSuccess: (doctorsList) {
            return setupSuccess(doctorsList);
          },
          doctorEmpty: () {
            return setupEmpty();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupSuccess(List<Doctor?>? doctorsList) {
    return DoctorsList(doctorsList: doctorsList);
  }

  Widget setupEmpty() {
    return const Center(
      child: Text(
        'No doctors found',
      ),
    );
  }
}
