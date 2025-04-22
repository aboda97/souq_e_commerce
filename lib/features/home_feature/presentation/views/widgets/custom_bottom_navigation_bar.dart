import 'package:flutter/material.dart';
import 'package:souq_app/core/utils/app_colors.dart';
import 'package:souq_app/features/home_feature/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:souq_app/features/home_feature/presentation/views/widgets/navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onItemTapped;
  const CustomBottomNavigationBar({super.key, required this.onItemTapped, required this.currentIndex});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
       height: 70,
       decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
       ),
       child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: bottomNavigationBarListItems.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;

          return GestureDetector(
            onTap: () {
                setState(() {
                  widget.onItemTapped(index);                 
                });
              },
            child: NaivgationBarItem(
              bottomNavigationBarEntity: entity,
              isSelected: widget.currentIndex == index,
            ),
          );
        }).toList(),
       )
    );
  }
}