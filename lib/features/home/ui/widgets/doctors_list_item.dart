import 'package:appointment/core/helpers/spacing.dart';
import 'package:appointment/core/theming/styles.dart';
import 'package:appointment/features/home/data/models/specializations_response_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListItem extends StatelessWidget {
  final Doctor? doctor;
  const DoctorsListItem({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://static.wikia.nocookie.net/five-world-war/images/6/64/Hisoka.jpg/revision/latest?cb=20190313114050',
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image(
                image: imageProvider,
                width: 100.w,
                fit: BoxFit.cover,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor?.name ?? 'Name',
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5),
                Text(
                  '${doctor?.degree} | ${doctor?.phone}',
                  style: TextStyles.font12GreyMedium,
                ),
                verticalSpace(5),
                Text(
                  doctor?.email ?? 'Email',
                  style: TextStyles.font12GreyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
