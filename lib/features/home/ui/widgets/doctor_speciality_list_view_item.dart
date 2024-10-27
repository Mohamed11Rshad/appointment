import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/theming/colors.dart';
import 'package:appointment/core/theming/styles.dart';
import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListViewItem extends StatelessWidget {
  final int index;
  final SpecializationsData? specializationsData;
  const DoctorSpecialityListViewItem({
    super.key,
    required this.index,
    this.specializationsData,
  });

  @override
  Widget build(BuildContext context) {
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
            specializationsData?.name ?? "Specialization",
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
    ;
  }
}
