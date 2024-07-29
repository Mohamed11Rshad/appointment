import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/theming/styles.dart';
import 'package:appointment/features/home/ui/widgets/home_doctor_container_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsBlueContainer extends StatelessWidget {
  const DoctorsBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 175,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/images/home_blue_pattern.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: TextStyles.font18WhiteMedium,
                  textAlign: TextAlign.start,
                ),
                // verticalSpace(16),
                const SizedBox(height: 12),
                const HomeDoctorContainerElevatedButton(),
              ],
            ),
          ),
          Positioned(
            right: 24.w,
            child: Image.asset(
              'assets/images/home_doctor.png',
              height: 230,
            ),
          ),
        ],
      ),
    );
  }
}
