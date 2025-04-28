import 'package:flutter/material.dart';
import 'package:souq_app/core/components/custom_app_bar.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/features/best_selling_feature/presentation/widgets/best_selling_view_body.dart';
import 'package:souq_app/generated/l10n.dart';

class BestSellingView extends StatelessWidget {
  static const String routeName = 'BestSelling';
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: S.of(context).commonSelling,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              // radius: 36,
              backgroundColor: AppColors.appBgColor,
              child: Icon(
                Icons.notifications_active_outlined,
                color: AppColors.primaryColor,
                size: 28,
              ),
            ),
          ),
        ],
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 35,
                  offset: Offset(0, -2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Icon(Icons.arrow_back_ios,),
          ),
        ),
      ),
      body: BestSellingViewBody(),
    );
  }
}
