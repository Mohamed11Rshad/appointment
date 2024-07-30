import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/features/home/ui/widgets/doctor_speciality_list.dart';
import 'package:appointment/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:appointment/features/home/ui/widgets/home_top_bar.dart';
import 'package:appointment/features/home/ui/widgets/recommended_doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/doctor_speciality_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              verticalSpace(8),
              const DoctorsBlueContainer(),
              verticalSpace(8),
              const HomeSectionHeader(title: "Doctor Speciality"),
              verticalSpace(8),
              const DoctorSpecialityList(),
              verticalSpace(16),
              const DoctorsList(),
            ],
          ),
        ),
      ),
    );
  }
}
