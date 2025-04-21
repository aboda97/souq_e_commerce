import 'package:flutter/material.dart';
import 'package:souq_app/constants.dart';
import 'package:souq_app/core/components/custom_text_form_field.dart';
import 'package:souq_app/core/utils/app_styles.dart';
import 'package:souq_app/core/components/custom_card_product_item.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/offer_list_items.dart';
import 'package:souq_app/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CustomHomeAppBar()),
          SliverToBoxAdapter(
            child: CustomTextFormField(
              prefixIcon: Icons.search_outlined,
              onPressed: () {},
              suffixIcon: Icons.tune_outlined,
              hintText: S.of(context).searchForHome,
            ),
          ),
          SliverToBoxAdapter(child: OfferListItems()),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).commonSelling, style: TextStyles.bold16),
                Text(S.of(context).moreThan, style: TextStyles.regular13),
              ],
            ),
          ),
          SliverGrid(
          
            delegate: SliverChildBuilderDelegate(
              childCount: 8,
              (context, index) => const CustomCardProductItem(),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 163 / 214,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 8,
            ),
          ),
        ],
      ),
    );
  }
}
