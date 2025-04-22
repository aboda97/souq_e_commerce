
import 'package:flutter/material.dart';
import 'package:souq_app/features/home_feature/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/active_items.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/de_avtive_items.dart';

class NaivgationBarItem extends StatelessWidget {
  const NaivgationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.labelName,
          )
        : DeActiveItem(
            imagePath: bottomNavigationBarEntity.deActiveImage,
          );
  }
}
