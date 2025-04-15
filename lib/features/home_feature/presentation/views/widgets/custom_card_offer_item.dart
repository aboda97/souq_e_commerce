import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq_app/core/utils/assets_paths.dart';

class CustomCardOfferItem extends StatelessWidget {
  const CustomCardOfferItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        
      ),
      child: Stack(
        children: [
        // SvgPicture.asset(AssetsPaths.appFruitBgPath),
        Image.asset(AssetsPaths.appBgFruitNewPath),
         SvgPicture.asset(AssetsPaths.appGreenBgPath)
        ],
      ),
    );
  }
}