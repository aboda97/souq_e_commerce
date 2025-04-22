

import 'package:souq_app/core/utils/assets_paths.dart';

class BottomNavigationBarEntity {
  final String activeImage, deActiveImage;
  final String labelName;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.deActiveImage,
      required this.labelName});
}

List<BottomNavigationBarEntity> get bottomNavigationBarListItems => [
      BottomNavigationBarEntity(
          activeImage: AssetsPaths.appNavBarActiveHomePngPath,
          deActiveImage:AssetsPaths.appNavBarDeActiveHomePngPath,
          labelName: 'الرئيسية'),
      BottomNavigationBarEntity(
          activeImage: AssetsPaths.appNavBarActiveProductPngPath,
          deActiveImage: AssetsPaths.appNavBarDeActiveProductPngPath,
          labelName: 'المنتجات'),
      BottomNavigationBarEntity(
          activeImage: AssetsPaths.appNavBarActiveShopCartPngPath,
          deActiveImage: AssetsPaths.appNavBarDeActiveShopCartPngPath,
          labelName: 'سلة التسوق'),
      BottomNavigationBarEntity(
          activeImage:AssetsPaths.appNavBarActiveProfilePngPath,
          deActiveImage: AssetsPaths.appNavBarDeActiveProfilePngPath,
          labelName: 'حسابي'),
    ];
