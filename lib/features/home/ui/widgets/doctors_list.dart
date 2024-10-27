import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:appointment/features/home/ui/widgets/doctors_list_item.dart';
import 'package:flutter/material.dart';

class DoctorsList extends StatelessWidget {
  final List<Doctor?>? doctorsList;
  const DoctorsList({super.key, this.doctorsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorsList?.length,
        itemBuilder: (context, index) {
          return DoctorsListItem(doctor: doctorsList?[index]);
        },
      ),
    );
  }
}
