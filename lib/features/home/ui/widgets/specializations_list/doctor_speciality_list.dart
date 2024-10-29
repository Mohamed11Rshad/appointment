import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:appointment/features/home/logic/home_cubit.dart';
import 'package:appointment/features/home/ui/widgets/specializations_list/speciality_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityList extends StatefulWidget {
  final List<SpecializationsData?> specializationsDataList;
  const DoctorSpecialityList(
      {super.key, required this.specializationsDataList});

  @override
  State<DoctorSpecialityList> createState() => _DoctorSpecialityListState();
}

class _DoctorSpecialityListState extends State<DoctorSpecialityList> {
  var selectedSpecialityIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationsDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecialityIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                    specializationId: widget.specializationsDataList[index]?.id,
                  );
            },
            child: SpecialityListViewItem(
              index: index,
              specializationsData: widget.specializationsDataList[index],
              selectedIndex: selectedSpecialityIndex,
            ),
          );
        },
      ),
    );
  }
}
