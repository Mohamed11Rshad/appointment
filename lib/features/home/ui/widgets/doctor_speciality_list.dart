import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/theming/colors.dart';
import 'package:appointment/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityList extends StatelessWidget {
  const DoctorSpecialityList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 4.w : 28.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: ColorsManager.lightBlue,
                  child: Image.asset(
                    "assets/images/home_general_speciality.png",
                    width: 28.w,
                    height: 28.h,
                  ),
                ),
                verticalSpace(12),
                Text(
                  "General",
                  style: TextStyles.font12DarkBlueRegular,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
