import 'package:flutter/material.dart';
import 'package:souq_app/core/utils/assets_paths.dart';
import 'package:souq_app/features/home_feature/data/models/product_item_model.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/custom_card_list_item.dart';
import 'package:souq_app/generated/l10n.dart';

class ProductItemGridView extends StatelessWidget {
  const ProductItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductItemModel> productList = [
      ProductItemModel(
        fruitName: S.of(context).Strawberry,
        imagePath: AssetsPaths.appStrawberryFruitPath,
        price: 25,
      ),
      ProductItemModel(
        fruitName: S.of(context).watermelon,
        imagePath: AssetsPaths.appwatermelonFruitPath,
        price: 250,
      ),
      ProductItemModel(
        fruitName: S.of(context).banana,
        imagePath: AssetsPaths.appbananaFruitPath,
        price: 25000,
      ),
    ];
    return Expanded(
      child: GridView.builder(
        itemCount: productList.length,
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          final product = productList[index];
          return CustomCardListItem(
            imagePath: product.imagePath,
            fruitName: product.fruitName,
            price: '${product.price} ${S.of(context).salary}',
            onAddPressed: () {
              print('Add ${product.fruitName}');
            },
          );
        },
      ),
    );
  }
}
