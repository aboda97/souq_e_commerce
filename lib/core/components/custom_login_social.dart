import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/utils/app_styles.dart';

class CustomLoginSocial extends StatelessWidget {
  final String assetIconPath;
  final String title;
  final void Function() onPressed;
  const CustomLoginSocial({
    super.key,
    required this.assetIconPath,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kVerticalPaddding),
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadius),
        border: Border.all(color: Colors.grey),
      ),
      child: TextButton.icon(
        onPressed: onPressed,
        label: Text(title, style: TextStyles.bold16),
        icon: SvgPicture.asset(assetIconPath),
      ),
    );
  }
}
