import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:appointment/features/home/ui/widgets/doctor_speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityList extends StatelessWidget {
  final List<SpecializationsData?> specializationsDataList;
  const DoctorSpecialityList(
      {super.key, required this.specializationsDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationsDataList.length,
        itemBuilder: (context, index) {
          return DoctorSpecialityListViewItem(
            index: index,
            specializationsData: specializationsDataList[index],
          );
        },
      ),
    );
  }
}
