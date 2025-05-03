import 'package:flutter/material.dart';
import 'package:souq_app/core/helper_functions/get_user_data.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/core/utils/app_styles.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/generated/l10n.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      trailing: CircleAvatar(
       // radius: 36,
        backgroundColor: AppColors.appBgColor,
        child: Icon(
            Icons.notifications_active_outlined,
            color: AppColors.primaryColor,
            size: 28,
          ),
      ),
      leading: Image.asset(AssetsPaths.appProfileImgPath),
      title: Text(S.of(context).goodMorning, style: TextStyles.regular16),
     // subtitle: Text(getUserData().userName, style: TextStyles.bold16),
     subtitle: Text(S.of(context).userProfileName, style: TextStyles.bold16),
    );
  }
}
