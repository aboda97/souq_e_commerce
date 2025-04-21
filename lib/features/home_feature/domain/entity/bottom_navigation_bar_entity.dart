

import 'package:souq_app/core/utils/assets_paths.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
          activeImage: AssetsPaths.appNavBarActiveHomePngPath,
          inActiveImage:AssetsPaths.appNavBarDeActiveHomePngPath,
          name: 'الرئيسية'),
      BottomNavigationBarEntity(
          activeImage: AssetsPaths.appNavBarActiveProductPngPath,
          inActiveImage: AssetsPaths.appNavBarDeActiveProductPngPath,
          name: 'المنتجات'),
      BottomNavigationBarEntity(
          activeImage: AssetsPaths.appNavBarActiveShopCartPngPath,
          inActiveImage: AssetsPaths.appNavBarDeActiveShopCartPngPath,
          name: 'سلة التسوق'),
      BottomNavigationBarEntity(
          activeImage:AssetsPaths.appNavBarActiveProfilePngPath,
          inActiveImage: AssetsPaths.appNavBarDeActiveProfilePngPath,
          name: 'حسابي'),
    ];
