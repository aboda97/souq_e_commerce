import 'package:flutter/material.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/core/utils/app_styles.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/generated/l10n.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: CircleAvatar(
        radius: 36,
        backgroundColor: AppColors.appBgColor,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_active_outlined,
            color: AppColors.primaryColor,
            size: 28,
          ),
        ),
      ),
      leading: Image.asset(AssetsPaths.appProfileImgPath),
      title: Text(S.of(context).goodMorning, style: TextStyles.regular16),
      subtitle: Text(S.of(context).userProfileName, style: TextStyles.bold16),
    );
  }
}
