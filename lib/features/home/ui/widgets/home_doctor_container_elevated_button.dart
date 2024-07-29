import 'package:appointment/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDoctorContainerElevatedButton extends StatelessWidget {
  const HomeDoctorContainerElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 50.h,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48.r),
            ),
          ),
          child: Text(
            'Find Nearby',
            style: TextStyles.font12BlueRegular,
          ),
        ),
      ),
    );
  }
}
