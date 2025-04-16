import 'package:flutter/material.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/core/utils/app_styles.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/custom_card_list_item.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/custom_card_offer_item.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/custom_home_app_bar.dart';
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
          Expanded(
            child: GridView.builder(
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7, 
            ),
            itemBuilder: (context, index) {
              return const CustomCardListItem();
            },
                    ),
          ),
        ],
      ),
    );
  }
}