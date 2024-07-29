import 'package:appointment/core/theming/styles.dart';
import 'package:flutter/material.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
    this.leadingText,
    this.onLeadingPressed,
  });

  final String title;
  final String? leadingText;
  final Function()? onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.font18DarkBlueSemibold,
        ),
        const Spacer(),
        TextButton(
          onPressed: onLeadingPressed,
          child: Text(
            leadingText ?? 'See All',
            style: TextStyles.font12BlueRegular,
          ),
        ),
      ],
    );
  }
}
