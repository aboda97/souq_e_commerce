import 'package:flutter/material.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/core/utils/app_styles.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/login_view.dart';
import 'package:souq_app/features/authentication_feature/presentation/views/register_view.dart';
import 'package:souq_app/features/home_feature/presentation/views/home_view.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/custom_card_offer_item.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/home_bottom_navigation_bar.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/product_item_grid_view.dart';
import 'package:souq_app/features/test_localization_feature/presentation/views/test.dart';
import 'package:souq_app/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: Column(
        children: [
          CustomHomeAppBar(),
          CustomTextFormField(
            prefixIcon: Icons.search_outlined,
            onPressed: (){},
            suffixIcon: Icons.tune_outlined,
            hintText: S.of(context).searchForHome,
          ),
          CustomCardOfferItem(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).commonSelling,style: TextStyles.bold16,),
              Text(S.of(context).moreThan,style: TextStyles.regular13,),
          ]),
          ProductItemGridView(),
          // HomeBottomNavigationBar(pages: [
          //   HomeView(),
          //   TestView(),
          //   LoginView(),
          //   RegisterView(),
          // ],
          // ),
        ],
      ),
    );
  }
}