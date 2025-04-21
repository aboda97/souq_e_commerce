import 'package:flutter/material.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/custom_card_offer_item.dart';

class OfferListItems extends StatelessWidget {
  const OfferListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 342 / 158,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const CustomCardOfferItem(),
        itemCount: 4,
      ),
    );
  }
}
