import 'package:flutter/material.dart';
import 'package:souq_app/core/components/custom_card_product_item.dart';
import 'package:souq_app/core/utils/app_styles.dart';
import 'package:souq_app/generated/l10n.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(S.of(context).commonSelling, style: TextStyles.bold16),
                //  Text(S.of(context).moreThan, style: TextStyles.regular13),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
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
